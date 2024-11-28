import 'package:braille_app/components/caracter_translator.dart';
import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/components/translation.dart';
import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhraseTranslatorScreen extends StatelessWidget {
  const PhraseTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context);
    var texto = ball.braille_translator('teste');
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      body: Column(
        children: [Translation(), MatrizShowed(), CaracterTranslator()],
      ),
    );
  }
}
