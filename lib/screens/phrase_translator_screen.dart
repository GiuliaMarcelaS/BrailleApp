import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/components/translation.dart';
import 'package:flutter/material.dart';

class PhraseTranslatorScreen extends StatelessWidget {
  const PhraseTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: const [
          Translation(),
          MatrizShowed(),
        ],
    );
  }
}