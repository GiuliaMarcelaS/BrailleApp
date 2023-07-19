import 'package:braille_app/components/matriz_number.dart';
import 'package:braille_app/components/number_translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NumberTranslatorScreen extends StatelessWidget {
  const NumberTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatrizNumber(),
        NumberTranslator(),
      ],
    );
  }
}