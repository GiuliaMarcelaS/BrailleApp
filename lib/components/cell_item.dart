import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
import 'package:provider/provider.dart';
class CellItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final fase = Provider.of<Fase>(context);
  final passer = Provider.of<Passer>(context);
  //final ball = Provider.of<Ball>(context, listen: false);
 // final passer1 = Provider.of<Passer1>(context);
  //final passerItem = Provider.of<PasserItem>(context);
    return GridTile(
      child: MatrizShowed()
      );
  }
}