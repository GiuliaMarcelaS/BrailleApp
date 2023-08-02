import 'package:braille_app/components/expressions_translator.dart';
import 'package:braille_app/components/matriz_expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExpressionTranslatorScreen extends StatelessWidget {
  const ExpressionTranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatrizExpressions(),
        ExpressionsTranslator(),
      ],
    );
  }
}