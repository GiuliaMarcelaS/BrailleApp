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
    final caracteresMap = Map<String, String>.from(questao.caracteres ?? {});
    final sortedEntries = caracteresMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    // A sua lógica para identificar o caso dos numerais é mantida intacta.
    final isNumberCase = (sortedEntries.isNotEmpty &&
        (questao.mostrarPopupMaiuscula == false &&
            sortedEntries.every((e) =>
                RegExp(r'^\d+$').hasMatch(e.key) && e.value.length > 1)));

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // O `isNumberCase ? ... : ...` decide qual layout usar
        child: isNumberCase
            // LAYOUT PARA NÚMEROS: Esta parte não foi alterada e continua como você enviou.
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (questao.enunciado != null) ...[
                    Text(
                      questao.enunciado!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                  Expanded(
                    child: LayoutBuilder(
                      builder: (ctx, constraints) {
                        final count = sortedEntries.length;
                        final itemW = constraints.maxWidth / count;
                        return Row(
                          children: sortedEntries.map((entry) {
                            return SizedBox(
                              width: itemW,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: itemW * .8,
                                    height: itemW * .8,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Transform.translate(
                                        offset: Offset(0, 4),
                                        child: Text(
                                          entry.value,
                                          style: const TextStyle(
                                              fontSize: 32, height: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      entry.key,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
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
                        padding:
                            const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            // LAYOUT PARA O CASO GERAL (LETRAS/PALAVRAS): Esta parte foi corrigida com o Wrap.
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (questao.enunciado != null) ...[
                    Text(
                      questao.enunciado!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          const TextSpan(
                              text:
                                  "Memorize os caracteres abaixo e, em seguida, clique em "),
                          const TextSpan(
                            text: "Continuar",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: " para prosseguir"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (sortedEntries.isNotEmpty)
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16.0,
                        runSpacing: 16.0,
                        children: sortedEntries.map((entry) {
                          final keyChars = entry.key.split('');
                          final valChars = entry.value.split('');
                          
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(keyChars.length, (i) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (valChars[i] == "⠨")
                                      IconButton(
                                        icon: const Icon(Icons.info_outline,
                                            size: 15,
                                            color: Colors.green),
                                        padding: EdgeInsets.zero,
                                        constraints:
                                            const BoxConstraints(),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) =>
                                                AlertDialog(
                                              title:
                                                  const Text("Dica"),
                                              content: const Text(
                                                "O caractere de seta indica letra maiúscula.\n"
                                                "Ele vem antes da letra correspondente.",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(ctx)
                                                          .pop(),
                                                  child: const Text(
                                                      "Entendi"),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade400),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Transform.translate(
                                        offset: Offset(0, 4),
                                        child: Text(
                                          valChars[i],
                                          style: const TextStyle(
                                              fontSize: 32, height: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      keyChars[i],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        }).toList(),
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
                        padding:
                            const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Continuar',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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