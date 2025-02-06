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
  @override
  Widget build(BuildContext context) {
    var ball = Provider.of<Ball>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Escrever em Braile'),
      ),
      body: Column(
        children: [
          Matriz(),
          SizedBox(height: 20),
          Text(
            ball.separaCaracteres.isEmpty
                ? "_"
                : ball.separaCaracteres.join(''),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
