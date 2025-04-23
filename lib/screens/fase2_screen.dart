import 'package:braille_app/blocs/game_flow_bloc.dart';
import 'package:braille_app/models/minigame_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:braille_app/components/minigames_templates/base_minigame.dart';

class Fase2Screen extends StatelessWidget {
  final String faseId;

  Fase2Screen({
    this.faseId = '',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameFlowBloc()..add(LoadFaseEvent(faseId)),
      child: Scaffold(
        body: BlocBuilder<GameFlowBloc, GameFlowState>(
          builder: (context, state) {
            if (state is FaseLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MiniGameStarted) {
              return _buildMiniGameScreen(state, context);
            } else if (state is GameOver) {
              return _buildGameOverScreen(context);
            } else if (state is FaseCompleted) {
              return _buildFaseCompletedScreen(context);
            }
            return Center(child: Text('Estado desconhecido'));
          },
        ),
      ),
    );
  }

  Widget _buildMiniGameScreen(MiniGameStarted state, BuildContext context) {
    switch (state.miniGame.type) {
      case MiniGameType.LETTER_RECOGNITION:
        return LetterRecognitionGame(
          config: state.miniGame,
          onAnswerSubmitted: (isCorrect) {
            context.read<GameFlowBloc>().add(AnswerSubmittedEvent(isCorrect));
          },
        );
      default:
        return Center(child: Text('MiniGame não implementado'));
    }
  }

  Widget _buildGameOverScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Game Over!', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<GameFlowBloc>().add(RetryFaseEvent());
            },
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildFaseCompletedScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Fase Concluída!', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Voltar para Fases'),
          ),
        ],
      ),
    );
  }
}
