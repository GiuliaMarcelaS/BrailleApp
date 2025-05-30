import 'package:braille_app/models/questao_model.dart';
import 'package:flutter/material.dart';

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

  @override
  void didUpdateWidget(covariant LetraLinhaGame oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Limpa seleções sempre que a widget for atualizada (nova questão)
    setState(() {
      _selecionadas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        // Enunciado
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.questao.enunciado ?? '',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        // Espaço flexível para centralizar o Row de braille
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.questao.opcoes?.length ?? 0,
                (index) {
                  final letra = widget.questao.opcoes![index];
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
                        color: selecionada ? Colors.green.withOpacity(0.2) : null,
                      ),
                      child: Text(
                        letra,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        // Botão fixa ao fim
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              final acerto =
                  _selecionadas.length == (widget.questao.corretas?.length ?? 0) &&
                      _selecionadas.every(widget.questao.corretas?.contains ?? (_) => false);
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
    );
  }
}