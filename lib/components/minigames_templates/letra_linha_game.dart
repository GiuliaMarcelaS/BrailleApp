import 'package:braille_app/models/questao_model.dart';
import 'package:flutter/material.dart';

class LetraLinhaGame extends StatefulWidget {
  final QuestaoModel questao;
  final void Function(bool acerto) onSubmit;

  const LetraLinhaGame({
    super.key,
    required this.questao,
    required this.onSubmit,
  });

  @override
  State<LetraLinhaGame> createState() => _LetraLinhaGameState();
}

class _LetraLinhaGameState extends State<LetraLinhaGame> {
  final Set<int> _selecionadas = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.questao.enunciado ?? '', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.questao.opcoes!.length, (index) {
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
          }),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            final acerto = _selecionadas.length ==
                    widget.questao.corretas!.length &&
                _selecionadas.every(widget.questao.corretas!.contains);
            widget.onSubmit(acerto);
          },
          child: const Text("Responder"),
        )
      ],
    );
  }
}
