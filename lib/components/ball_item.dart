// criando uma classe para cada bola (para criar celula interativa que traduz letras)

import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BallItem extends StatefulWidget {
  const BallItem({super.key});



  @override
  State<BallItem> createState() => _BallItemState();
}

class _BallItemState extends State<BallItem> {
  @override
  Widget build(BuildContext context) {
  final ball = Provider.of<Ball>(context);

    return GridTile(
      child: GestureDetector(
          child: Icon(
          ball.pressedBall1? Icons.circle : Icons.circle_outlined,
          ),
          onTap: ()=> ball.pressBall,
        ),
      );
  }
}