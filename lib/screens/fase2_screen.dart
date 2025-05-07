import 'package:braille_app/blocs/game_flow_bloc.dart';
import 'package:braille_app/models/minigame_model.dart';
import 'package:braille_app/services/auth.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:braille_app/components/minigames_templates/base_minigame.dart';
import 'package:provider/provider.dart';

class Fase2Screen extends StatelessWidget {
  final String faseId;

  Fase2Screen({
    this.faseId = '',
  });

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return BlocProvider(
      create: (context) => GameFlowBloc(faseService: FaseService(token: auth.token??'', userId: auth.userId??''))..add(LoadFaseEvent(faseId)),
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
  Widget gameWidget;

  switch (state.miniGame.type) {
    case MiniGameType.LETTER_RECOGNITION:
      gameWidget = LetterRecognitionGame(
        config: state.miniGame,
        onAnswerSubmitted: (isCorrect) {
          context.read<GameFlowBloc>().add(AnswerSubmittedEvent(isCorrect));
        },
      );
      break;
    default:
      gameWidget = Center(child: Text('MiniGame não implementado'));
  }

  return Column(
    children: [
      const SizedBox(height: 40),
      _buildHearts(state.remainingLives),
      const SizedBox(height: 16),
      Expanded(child: gameWidget),
    ],
  );
}

Widget _buildHearts(int lives) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Icon(
          Icons.favorite,
          color: index < lives ? Colors.red : Colors.grey,
          size: 32,
        ),
      );
    }),
  );
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
  Future.microtask(() {
    Navigator.pop(context); // volta para LearnScreen
  });

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Fase Concluída!', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        CircularProgressIndicator(),
      ],
    ),
  );
}
}
