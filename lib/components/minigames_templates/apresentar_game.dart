import 'package:flutter/material.dart';
import 'package:braille_app/models/questao_model.dart';

class ApresentarGame extends StatelessWidget {
  final QuestaoModel questao;
  final VoidCallback onContinue;

  const ApresentarGame({
    Key? key,
    required this.questao,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caracteres = questao.caracteres ?? {};

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Título ou ID do padrão
          if (questao.id != null)
            Text(
              'Padrão: ${questao.id}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 16),

          // Lista de caracteres em Braille
          Expanded(
            child: ListView(
              children: caracteres.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        entry.value, // o padrão Braille
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        entry.key.toString(), // letra correspondente
                        style: const TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Botão continuar
          ElevatedButton(
            onPressed: onContinue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Continuar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
