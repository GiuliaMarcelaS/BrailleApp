import 'package:braille_app/components/minigames_templates/letra_linha_game.dart';
import 'package:braille_app/models/minigame_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:braille_app/blocs/game_flow_bloc.dart';
import 'package:braille_app/blocs/game_flow_event.dart';
import 'package:braille_app/blocs/game_flow_state.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:braille_app/components/minigames_templates/apresentar_game.dart';
import 'package:braille_app/components/minigames_templates/completar_palavra_game.dart';

class Fase2Screen extends StatelessWidget {
  final String faseId;
  final FaseService faseService;

  const Fase2Screen({
    Key? key,
    required this.faseId,
    required this.faseService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameFlowBloc(faseService: faseService)
        ..add(LoadFaseEvent(faseId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fase \$faseId'),
        ),
        body: BlocBuilder<GameFlowBloc, GameFlowState>(
          builder: (context, state) {
            if (state is FaseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MiniGameStarted) {
              Widget gameWidget = const SizedBox.shrink();

              switch (state.miniGame.type) {
                case MiniGameType.APRESENTAR:
                  gameWidget = ApresentarGame(
                    questao: state.miniGame.questao!,
                    onSubmit: (acertou) => context
                        .read<GameFlowBloc>()
                        .add(AnswerSubmittedEvent(acertou, faseId)),
                  );
                  break;
                case MiniGameType.MULTIPLE_LETRAS_LINHA:
                  gameWidget = LetraLinhaGame(
                    questao: state.miniGame.questao!,
                    onSubmit: (acertou) => context
                        .read<GameFlowBloc>()
                        .add(AnswerSubmittedEvent(acertou, faseId)),
                  );
                  break;
                case MiniGameType.COMPLETAR_PALAVRA:
                  gameWidget = CompletarPalavraSimpleGame(
                    questao: state.miniGame.questao!,
                    onSubmit: (acertou) => context
                        .read<GameFlowBloc>()
                        .add(AnswerSubmittedEvent(acertou, faseId)),
                  );
                  break;
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.remainingLives,
                        (i) => const Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                  ),
                  Expanded(child: gameWidget),
                ],
              );
            } else if (state is FaseCompleted) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Próxima Fase'),
                ),
              );
            } else if (state is GameOver) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Game Over', style: TextStyle(fontSize: 24)),
                    ElevatedButton(
                      onPressed: () => context
                          .read<GameFlowBloc>()
                          .add(RetryFaseEvent()),
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}