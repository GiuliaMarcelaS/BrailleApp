import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EscreverScreen extends StatelessWidget {
  const EscreverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ball = Provider.of<Ball>(context);
    var cell = Provider.of<Cell>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Escrever em Braille'),
      ),
      body: Column(
        children: [
          Matriz(),
          Text(ball.cell_translator([
            cell.isClicked1,
            cell.isClicked2,
            cell.isClicked3,
            cell.isClicked4,
            cell.isClicked5,
            cell.isClicked6
          ])),
        ],
      ),
    );
  }
}
