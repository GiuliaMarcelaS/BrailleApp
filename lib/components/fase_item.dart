import 'package:braille_app/models/passer.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
import 'package:provider/provider.dart';
class FaseItem extends StatelessWidget {

  const FaseItem({super.key});

  @override
  Widget build(BuildContext context) {
  final fase = Provider.of<Fase>(context);
  final passer = Provider.of<Passer>(context);
    return GridTile(
      footer: GridTileBar(
        title: Text(
          fase.title),
      ),
      child: GestureDetector(
        onTap: (passer.faseCompleta >= fase.id? () => Navigator.of(context).pushNamed('/fases-screen', arguments: fase) : null),
        child: Card(
        color:(passer.faseCompleta >= fase.id? Colors.green : Colors.grey),
        ),
      ),
      );
  }
}