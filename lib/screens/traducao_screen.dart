import 'package:braille_app/components/balls_grid.dart';
import 'package:braille_app/components/fase_grid.dart';
import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/components/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TraducaoScreen extends StatelessWidget {
  const TraducaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tradução'),  
      ),
      body: Column(
        children: [
          MatrizShowed(),
          Translation(),
        ],
      ),
    );
  }
}