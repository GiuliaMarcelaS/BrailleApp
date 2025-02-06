import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EscreverScreen2 extends StatefulWidget {
  const EscreverScreen2({super.key});

  @override
  State<EscreverScreen2> createState() => _EscreverScreen2State();
}

class _EscreverScreen2State extends State<EscreverScreen2> {

  @override
  Widget build(BuildContext context) {
    var ball = Provider.of<Ball>(context);
    var cell = Provider.of<Cell>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Escrever em Braile'),),
      body: Column(
        children: [
          Matriz(),
          Text(ball.separaCaracteres.join(''),),
        ],
      ),
    );
  }
}
