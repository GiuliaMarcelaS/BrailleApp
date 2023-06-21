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

  //  refreshCells(BuildContext context,){
  //   return Provider.of<CellsList>(
  //     context,
  //     listen: false,
  //   ).addCells(letra, Ball());
  // }
  
  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<CellsList>(context,);
    // final Ball ballt = ModalRoute.of(context)!.settings.arguments as Ball;
    return Column(
      children: [
        Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              ball.reset(letra);
              letra = valor;
             // ball.translate(letra,cells.id);
              cells.addCells(letra);
              cells.id = 0;
            },
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}