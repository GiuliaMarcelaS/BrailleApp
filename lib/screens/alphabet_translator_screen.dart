import 'package:braille_app/components/alphabet_translator.dart';
import 'package:braille_app/components/matriz_alphabet.dart';
import 'package:braille_app/components/matriz_showed.dart';
import 'package:braille_app/components/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AlphabetTranslatorScreen extends StatefulWidget {
  const AlphabetTranslatorScreen({super.key});

  @override
  State<AlphabetTranslatorScreen> createState() => _AlphabetTranslatorScreenState();
}

class _AlphabetTranslatorScreenState extends State<AlphabetTranslatorScreen> {
  // @override
  // void initState() {
  //
  //   super.initState();

  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatrizAlphabet(),
        AlphabetTranslator(),
      ],
    );
  }
}