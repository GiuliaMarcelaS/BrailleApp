import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/models/user_data.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/fases.dart';
import 'package:provider/provider.dart';
class FaseItem extends StatelessWidget {

  const FaseItem({super.key});

  @override
  Widget build(BuildContext context) {
  final fase = Provider.of<Fase>(context);
  final topico = Provider.of<Topico>(context);
  final passer = Provider.of<Passer>(context);
  // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  // final UserData userdata = args['userdata'];
    return GridTile(
      header: Container(
        height: 35,
        child: Icon(passer.faseCompleta >= fase.id?Icons.play_circle: Icons.lock,size: 25, color: passer.faseCompleta >= fase.id? Color(0xFF208B52):Colors.grey)),
      footer: GridTileBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fase.title,
              style: TextStyle(color: Colors.black),),
            Text(
              fase.frase,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800),),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: (passer.faseCompleta >= fase.id? () => Navigator.of(context).pushNamed('/fases-screen', arguments: {'fase': fase,"topico": topico, "passer":passer}) : null),
        child: Card(
          child: Image.network(fase.imageUrl,),
          color:(Colors.white),
        ),
      ),
      );
  }
}