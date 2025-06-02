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
    // Limpa seleções e fecha tip ao trocar de questão
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

  /// Extrai todas as letras individuais entre aspas no enunciado
  List<String> _extrairLetrasDoEnunciado(String enunciado) {
    final regExp = RegExp(r'"([^"]+)"');
    final matches = regExp.allMatches(enunciado);
    // Cada match.group(1) pode ser, por exemplo, "df" ou "d"
    // Vamos separar cada caractere individual
    final letras = <String>[];
    for (final m in matches) {
      final grupo = m.group(1)!; // e.g. "df" ou "d"
      for (var caractere in grupo.split('')) {
        letras.add(caractere.toLowerCase());
      }
    }
    return letras;
  }

  @override
  Widget build(BuildContext context) {
    // Enunciado completo (incluindo as aspas)
    final enunciadoText = widget.questao.enunciado ?? '';
    // Lista de letras em português extraídas do enunciado
    final letrasDoEnunciado = _extrairLetrasDoEnunciado(enunciadoText);

    // Opções exibidas na tela (cada item é um caractere Braille)
    final opcoesList = widget.questao.opcoes ?? [];

    // Índices corretos (para verificar se o usuário acertou)
    final corretasIndices = widget.questao.corretas ?? [];

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Exibe o enunciado completo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                enunciadoText,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),

            // Torna as opções scrolláveis na horizontal
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

            // Botão "Continuar"
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
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),

        // Botão de dica (ícone) no canto superior direito
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

        // Overlay de dica: exibe uma lista (Braille, Letra) para cada letra do enunciado
        if (_showTip)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleTip, // Fecha ao tocar fora do card
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
                        // Usa o método braille_translator para cada letra
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
