import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  String letra = '';

   refreshCells(BuildContext context){
    return Provider.of<CellsList>(
      context,
      listen: false,
    ).addCells(letra);
  }
  
  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<CellsList>(context,);
    return Column(
      children: [
        Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              ball.reset(letra);
              letra = valor;
              ball.translate(letra);
              refreshCells(context);
            },
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}