import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
class FaseItem extends StatelessWidget {

  void _fases(BuildContext context){
    Navigator.of(context).pushNamed('/fases-screen');
}
  final Fase fase;
  const FaseItem({
    Key? key,
    required this.fase,
  }) : super(key:key);
 

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Card(
          color: Colors.green,
        ),
        onTap: () => _fases(context),
      ),
      footer: GridTileBar(
        title: Text(
          fase.title),
      ),
      );
  }
}