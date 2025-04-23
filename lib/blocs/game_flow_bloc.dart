import 'dart:async';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:flutter/material.dart';
import 'game_flow_event.dart';
import 'game_flow_state.dart';
import 'package:braille_app/components/fase.dart';
import 'package:braille_app/data/fases2_data.dart';
import 'package:bloc/bloc.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  GameFlowBloc() : super(GameFlowInitial()) {
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
      // Simula carregamento
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

  void _onAnswerSubmitted(
    AnswerSubmittedEvent event,
    Emitter<GameFlowState> emit,
  ) {
    if (state is MiniGameStarted) {
      final currentState = state as MiniGameStarted;
      final fase = fases.firstWhere(
          (f) => f.miniGames.any((mg) => mg.id == currentState.miniGame.id));

      if (event.isCorrect) {
        _handleCorrectAnswer(fase, currentState, emit);
      } else {
        _handleWrongAnswer(currentState, emit);
      }
    }
  }

  void _handleCorrectAnswer(
    Fase fase,
    MiniGameStarted currentState,
    Emitter<GameFlowState> emit,
  ) {
    final currentIndex =
        fase.miniGames.indexWhere((mg) => mg.id == currentState.miniGame.id);

    if (currentIndex == fase.miniGames.length - 1) {
      emit(FaseCompleted());
    } else {
      emit(FaseLoaded(
        fase: fase,
        currentMiniGameIndex: currentIndex + 1,
        lives: currentState.remainingLives,
      ));
      // Auto-start next mini game
      add(StartMiniGameEvent(fase.miniGames[currentIndex + 1]));
    }
  }

  void _handleWrongAnswer(
    MiniGameStarted currentState,
    Emitter<GameFlowState> emit,
  ) {
    final newLives = currentState.remainingLives - 1;

    if (newLives <= 0) {
      emit(GameOver());
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
    if (state is GameOver || state is FaseCompleted) {
      final fase = fases.firstWhere((f) =>
          f.miniGames.any((mg) => (state as dynamic).miniGame?.id == mg.id));
      emit(FaseLoaded(fase: fase));
      add(StartMiniGameEvent(fase.miniGames[0]));
    }
  }
}
