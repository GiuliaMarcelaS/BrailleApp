import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/components/translation.dart';
import 'package:flutter/material.dart';

class TraducaoScreen extends StatelessWidget {
  const TraducaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tradução'),  
      ),
      body: Column(
        children: const [
          MatrizShowed(),
          Translation()
        ],
      ),
    );
  }
}