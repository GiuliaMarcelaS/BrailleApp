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
    return GridTile(
      child: GestureDetector(
        child: Card(
        color:(fase.id<=fase.fase? Colors.green : Colors.grey),
        ),
        onTap: (fase.id<=fase.fase? () => Navigator.of(context).pushNamed('/fases-screen', arguments: fase) : null),
      ),
      footer: GridTileBar(
        title: Text(
          fase.title),
      ),
      );
  }
}