import 'package:braille_app/components/fase_item.dart';
import 'package:braille_app/components/translation.dart';
import 'package:braille_app/models/fase_list.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/data/fases_data.dart';

import '../components/fase_grid.dart';


class ModulosScreen extends StatelessWidget {

  
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Módulos"),),
      body: FaseGrid(),
      
    );
  }
}
