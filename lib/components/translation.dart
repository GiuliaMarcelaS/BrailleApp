import 'package:braille_app/models/ball.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  String letra = '';

  
  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    return Column(
      children: [
        Form(
          child: TextField(
            decoration: InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              ball.reset(letra);
              letra = valor;
              ball.translate(letra);
            },
            controller: TextEditingController(),
          ),
        ),
        
       // ElevatedButton(onPressed: ball.translate(letra), child: Text("traduzir")
        //)
      ],
    );
  }
}