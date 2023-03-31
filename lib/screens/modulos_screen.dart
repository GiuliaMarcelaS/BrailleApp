import 'package:braille_app/components/fase_item.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/data/fases_data.dart';


class ModulosScreen extends StatelessWidget {
  final List<Fase> loadedFases = fasesData;

  
  void _celula(BuildContext context){
    Navigator.of(context).pushNamed('/celula-screen');
}

  void _F1(BuildContext context){
    Navigator.of(context).pushNamed('/F1-screen');
}
  void _fase1(BuildContext context){
    Navigator.of(context).pushNamed('/Fase1-screen');
}


  @override
  Widget build(BuildContext context) {
   
   // final pontosAcumulados = provider.pontosAcumulados;

    return Scaffold(
      appBar: AppBar(
        title: Text("Módulos"),),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedFases.length,
        itemBuilder: (ctx, i) => FaseItem(fase: loadedFases[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
        )
      
    );
  }
}