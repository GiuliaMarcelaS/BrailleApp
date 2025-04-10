import 'package:flutter/material.dart';

import '../components/fase.dart';

class Fase2Screen extends StatefulWidget {
  final Fase? fase;

  const Fase2Screen({super.key, this.fase});

  @override
  State<Fase2Screen> createState() => _FaseScreenState();
}

class _FaseScreenState extends State<Fase2Screen> {
  int lives = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.fase?.title ?? '')),
      body: Column(
        children: [
          Text('Vidas: $lives'),
          // Aqui você coloca o conteúdo específico da fase
          Text(widget.fase?.description ?? ''),
          // Lista de perguntas, desafios etc
        ],
      ),
    );
  }
}
