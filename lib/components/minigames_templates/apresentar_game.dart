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
    // Converte para Map<String, String> e ordena alfabeticamente pelas chaves
    final caracteresMap = Map<String, String>.from(questao.caracteres ?? {});
    final sortedEntries = caracteresMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exibe o ID do padrão
            if (questao.id != null) ...[
              Text(
                "Padrão ${int.parse(questao.id.split('_').last)}: ${questao.enunciado!}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
            // Grid responsivo de caracteres
            if (sortedEntries.isNotEmpty)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final count = sortedEntries.length;
                    final itemWidth = constraints.maxWidth / count;
                    return Row(
                      children: sortedEntries.map((entry) {
                        final keyChars = entry.key.split('');
                        final valueChars = entry.value.split('');
                        return SizedBox(
                          width: itemWidth,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Braille
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(keyChars.length, (i) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: i < keyChars.length - 1 ? 0.0 : 0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.grey.shade400),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          valueChars[i],
                                          style: const TextStyle(fontSize: 32, height: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(height: 6),
                              // Português sob cada célula
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(keyChars.length, (i) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: i < keyChars.length - 1 ? 8.0 : 0,
                                      ),
                                      child: Text(
                                        keyChars[i],
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Center(
                  child: Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
