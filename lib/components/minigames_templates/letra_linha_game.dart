import 'package:braille_app/models/questao_model.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/components/ball.dart'; // importe a classe Ball

class LetraLinhaGame extends StatefulWidget {
  final QuestaoModel questao;
  final void Function(bool acerto) onSubmit;

  const LetraLinhaGame({
    Key? key,
    required this.questao,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _LetraLinhaGameState createState() => _LetraLinhaGameState();
}

class _LetraLinhaGameState extends State<LetraLinhaGame> {
  final Set<int> _selecionadas = {};
  bool _showTip = false;
  late Ball _ballHelper; // instância de Ball para traduzir

  @override
  void initState() {
    super.initState();
    _ballHelper = Ball(); // inicializa o helper
  }

  @override
  void didUpdateWidget(covariant LetraLinhaGame oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selecionadas.clear();
      _showTip = false;
    });
  }

  void _toggleTip() {
    setState(() {
      _showTip = !_showTip;
    });
  }

  List<String> _extrairLetrasDoEnunciado(String enunciado) {
    final regExp = RegExp(r'"([^"]+)"');
    final matches = regExp.allMatches(enunciado);
    final letras = <String>[];
    for (final m in matches) {
      final grupo = m.group(1)!;
      for (var caractere in grupo.split('')) {
        letras.add(caractere.toLowerCase());
      }
    }
    return letras;
  }

  List<TextSpan> _formatarEnunciado(String texto) {
    final spans = <TextSpan>[];
    final regExp = RegExp(r'"([^"]+)"');
    int lastIndex = 0;

    for (final match in regExp.allMatches(texto)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: texto.substring(lastIndex, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      lastIndex = match.end;
    }

    if (lastIndex < texto.length) {
      spans.add(TextSpan(text: texto.substring(lastIndex)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final enunciadoText = widget.questao.enunciado ?? '';
    final letrasDoEnunciado = _extrairLetrasDoEnunciado(enunciadoText);
    final opcoesList = widget.questao.opcoes ?? [];
    final corretasIndices = widget.questao.corretas ?? [];

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: _formatarEnunciado(enunciadoText),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Row(
                    children: List.generate(
                      opcoesList.length,
                      (index) {
                        final caractereBraille = opcoesList[index];
                        final selecionada = _selecionadas.contains(index);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selecionada) {
                                _selecionadas.remove(index);
                              } else {
                                _selecionadas.add(index);
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selecionada ? Colors.green : Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: selecionada
                                  ? Colors.green.withOpacity(0.2)
                                  : null,
                            ),
                            child: Text(
                              caractereBraille,
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  final acerto =
                      _selecionadas.length == corretasIndices.length &&
                          _selecionadas.every(corretasIndices.contains);
                  widget.onSubmit(acerto);
                },
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

        Positioned(
          top: 80,
          right: 8,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.help_outline),
              tooltip: 'Mostrar dica',
              onPressed: _toggleTip,
            ),
          ),
        ),

        if (_showTip)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleTip,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                alignment: Alignment.center,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: letrasDoEnunciado.map((letraPortugues) {
                        final brailleChar =
                            _ballHelper.braille_translator(letraPortugues);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                brailleChar,
                                style: const TextStyle(fontSize: 32),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                letraPortugues,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
