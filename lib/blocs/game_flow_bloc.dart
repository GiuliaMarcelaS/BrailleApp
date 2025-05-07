import 'dart:async';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:flutter/material.dart';
import 'game_flow_event.dart';
import 'game_flow_state.dart';
import 'package:braille_app/components/fase.dart';
import 'package:braille_app/data/fases2_data.dart';
import 'package:bloc/bloc.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  final FaseService faseService;
  GameFlowBloc({required this.faseService}) : super(GameFlowInitial()) {
    on<LoadFaseEvent>(_onLoadFase);
    on<StartMiniGameEvent>(_onStartMiniGame);
    on<AnswerSubmittedEvent>(_onAnswerSubmitted);
    on<RetryFaseEvent>(_onRetryFase);
  }

  FutureOr<void> _onLoadFase(
    LoadFaseEvent event,
    Emitter<GameFlowState> emit,
  ) async {
    emit(FaseLoading());

    try {
      await Future.delayed(Duration(milliseconds: 500));

      final fase = fases.firstWhere((f) => f.id == event.faseId);
      emit(FaseLoaded(fase: fase));

      // Inicia automaticamente o primeiro minigame
      add(StartMiniGameEvent(fase.miniGames[0]));
    } catch (e) {
      emit(GameFlowInitial()); // Volta ao início em caso de erro
    }
  }

  void _onStartMiniGame(
    StartMiniGameEvent event,
    Emitter<GameFlowState> emit,
  ) {
    if (state is FaseLoaded) {
      final currentState = state as FaseLoaded;
      emit(MiniGameStarted(
        miniGame: event.miniGame,
        remainingLives: currentState.lives,
      ));
    }
  }

  Future<void> _onAnswerSubmitted(
  AnswerSubmittedEvent event,
  Emitter<GameFlowState> emit,
) async {
  if (state is MiniGameStarted) {
    final currentState = state as MiniGameStarted;
    final fase = fases.firstWhere(
      (f) => f.miniGames.any((mg) => mg.id == currentState.miniGame.id),
    );

    if (event.isCorrect) {
      await _handleCorrectAnswer(fase, currentState, emit); // ✅ await aqui
    } else {
      _handleWrongAnswer(fase, currentState, emit); // já é sync
    }
  }
}

  _handleCorrectAnswer(
  Fase fase,
  MiniGameStarted currentState,
  Emitter<GameFlowState> emit,
) async {
  final currentIndex =
      fase.miniGames.indexWhere((mg) => mg.id == currentState.miniGame.id);

  if (currentIndex == fase.miniGames.length - 1) {
    await faseService.atualizarFase(int.parse(fase.id) + 1);
    emit(FaseCompleted());
  } else {
    emit(FaseLoaded(
      fase: fase,
      currentMiniGameIndex: currentIndex + 1,
      lives: currentState.remainingLives,
    ));
    add(StartMiniGameEvent(fase.miniGames[currentIndex + 1]));
  }
}

  void _handleWrongAnswer(
  Fase fase,
  MiniGameStarted currentState,
  Emitter<GameFlowState> emit,
) {
  final newLives = currentState.remainingLives - 1;

  if (newLives <= 0) {
    emit(GameOver(faseId: fase.id));
  } else {
    emit(MiniGameStarted(
      miniGame: currentState.miniGame,
      remainingLives: newLives,
    ));
  }
}

  void _onRetryFase(
  RetryFaseEvent event,
  Emitter<GameFlowState> emit,
) {
  if (state is GameOver) {
    final faseId = (state as GameOver).faseId;
    final fase = fases.firstWhere((f) => f.id == faseId);
    emit(FaseLoaded(fase: fase));
    add(StartMiniGameEvent(fase.miniGames[0]));
  }
}
}
