import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
import 'package:provider/provider.dart';
class FaseItem extends StatelessWidget {


//   void _fases(BuildContext context){
 bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
  final fase = Provider.of<Fase>(context);
  final passer = Provider.of<Passer>(context);
 // final passer1 = Provider.of<Passer1>(context);
  //final passerItem = Provider.of<PasserItem>(context);
    return GridTile(
      child: GestureDetector(
        child: Card(
        color:(passer.faseCompleta >= fase.id? Colors.green : Colors.grey),
        ),
        onTap: (passer.faseCompleta >= fase.id? () => Navigator.of(context).pushNamed('/fases-screen', arguments: fase) : null),
      ),
      footer: GridTileBar(
        title: Text(
          fase.title),
      ),
      );
  }
}