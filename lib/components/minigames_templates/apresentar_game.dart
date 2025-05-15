import 'package:flutter/material.dart';
import 'package:braille_app/models/questao_model.dart';

class ApresentarGame extends StatelessWidget {
  final QuestaoModel questao;
  final void Function(bool acerto) onSubmit;

  const ApresentarGame({
    super.key,
    required this.questao,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    print('Enunciado recebido: ${questao.enunciado}');
    return Column(
      children: [
        Text(questao.enunciado, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Column(
          children: questao.caracteres!.entries.map((entry) {
            // Exibe cada caractere Braille junto com a letra correspondente
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    entry.value, // O caractere em Braille
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ' - ${entry.key}', // A letra correspondente em português
                    style: const TextStyle(fontSize: 32),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
         ElevatedButton(
          onPressed: () {
            onSubmit(true);
          },
          child: const Text("Continuar"),
        )
      ],
    );
  }
}
