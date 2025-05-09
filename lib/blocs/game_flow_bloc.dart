import 'dart:async';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:braille_app/components/fase.dart';
import 'package:braille_app/data/fases2_data.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  final FaseService faseService;

  GameFlowBloc({required this.faseService}) : super(GameFlowInitial()) {
    on<LoadFaseEvent>(_onLoadFase);
    on<StartMiniGameEvent>(_onStartMiniGame);
    on<AnswerSubmittedEvent>(_onAnswerSubmitted);
    on<RetryFaseEvent>(_onRetryFase);
  }

  Future<void> _onLoadFase(
    LoadFaseEvent event,
    Emitter<GameFlowState> emit,
  ) async {
    emit(FaseLoading());

    try {
      await Future.delayed(Duration(milliseconds: 300));

      final fase = fases.firstWhere((f) => f.id == event.faseId);
      final miniGames = await faseService.carregarMiniGamesDaFase(fase.id);

      print('Fase: ${fase.title}');
      print('MiniGames carregados: ${miniGames.length}');

      final faseComJogos = fase.copyWith(miniGames: miniGames);

      emit(FaseLoaded(fase: faseComJogos));
      if (miniGames.isNotEmpty) {
        add(StartMiniGameEvent(miniGames[0]));
      } else {
        print('⚠️ Nenhum minigame encontrado para esta fase');
      }
    } catch (e) {
      print('Erro ao carregar fase: $e');
      emit(GameFlowInitial());
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
      print('➡️ MiniGame iniciado: ${event.miniGame.id}');
    }
  }

  Future<void> _onAnswerSubmitted(
    AnswerSubmittedEvent event,
    Emitter<GameFlowState> emit,
  ) async {
    if (state is MiniGameStarted) {
      final currentState = state as MiniGameStarted;
      final fase = await faseService.buscarFasePorMiniGameId(currentState.miniGame.id);

      if (event.isCorrect) {
        await _handleCorrectAnswer(fase, currentState, emit);
      } else {
        _handleWrongAnswer(fase, currentState, emit);
      }
    }
  }

  Future<void> _handleCorrectAnswer(
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
  ) async {
    if (state is GameOver) {
      final faseId = (state as GameOver).faseId;
      final fase = await faseService.carregarFasePorId(faseId);
      emit(FaseLoaded(fase: fase));
      add(StartMiniGameEvent(fase.miniGames[0]));
    }
  }
}