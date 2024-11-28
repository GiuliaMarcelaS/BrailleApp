import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaracterTranslator extends StatelessWidget {
  const CaracterTranslator({super.key});

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context);
    var texto = ball.braille_translator('teste');
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SelectableText(
          texto,
          style: TextStyle(
            fontSize: 32,
            // fontFamily: 'Braille',
          ),
        ),
      ),
    );
  }
}
