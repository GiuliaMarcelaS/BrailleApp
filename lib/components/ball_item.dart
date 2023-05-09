import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
import 'package:provider/provider.dart';
class BallItem extends StatelessWidget {


//   void _fases(BuildContext context){

  @override
  Widget build(BuildContext context) {
  final ball = Provider.of<Ball>(context);
 // final passer1 = Provider.of<Passer1>(context);
  //final passerItem = Provider.of<PasserItem>(context);
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