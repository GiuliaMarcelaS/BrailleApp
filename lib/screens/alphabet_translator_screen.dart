import 'package:braille_app/components/alphabet_translator.dart';
import 'package:braille_app/components/matriz_alphabet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AlphabetTranslatorScreen extends StatelessWidget {
  const AlphabetTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatrizAlphabet(),
        AlphabetTranslator()
      ],
    );
  }
}