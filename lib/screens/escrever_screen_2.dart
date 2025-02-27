import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EscreverScreen2 extends StatefulWidget {
  const EscreverScreen2({super.key});

  @override
  State<EscreverScreen2> createState() => _EscreverScreen2State();
}

class _EscreverScreen2State extends State<EscreverScreen2> {
  late TextEditingController _controller;
  late Ball ball;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ball = Provider.of<Ball>(context);
    _controller.text =
        ball.separaCaracteres.isEmpty ? "_" : ball.separaCaracteres.join('');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escrever em Braile'),
      ),
      body: Column(
        children: [
          Matriz(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controller,
              showCursor: true, // Habilita o cursor
              readOnly: false, // Permite interações no campo
              maxLines: null, // Permite múltiplas linhas
              decoration: InputDecoration(
                hintText: "Escreva seu texto",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              onChanged: (text) {
                ball.separaCaracteres = text.split('');
              },
              onTap: () {
                // Remove o "_" quando o usuário clica no campo
                if (_controller.text == "_") {
                  _controller.text = "";
                  ball.separaCaracteres.clear();
                }
              },
              onEditingComplete: () {
                FocusScope.of(context)
                    .unfocus(); // Esconde o teclado ao finalizar edição
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _handleBackspace,
                icon: Icon(Icons.backspace_outlined),
              ),
              const SizedBox(width: 10),
              IconButton(onPressed: _clearText, icon: Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }

  void _handleBackspace() {
    final cursorPos = _controller.selection.baseOffset;

    if (cursorPos > 0) {
      String text = _controller.text;
      text = text.substring(0, cursorPos - 1) + text.substring(cursorPos);
      _controller.text = text;

      // Atualiza a posição do cursor corretamente
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: cursorPos - 1),
      );

      // Atualiza a lista do provider
      ball.separaCaracteres = text.split('');
    }
  }

  void _clearText() {
    // Limpa o texto
    _controller.text = "";
    ball.separaCaracteres.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
