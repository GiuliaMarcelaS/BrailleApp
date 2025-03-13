import 'package:flutter/material.dart';

class MatrizMaiuscula extends StatelessWidget {
  MatrizMaiuscula({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribui uniformemente
          children: [
            SizedBox(
              width: 40, // Define um tamanho fixo semelhante ao IconButton
              height: 30,
              child: Icon(Icons.circle),
            ),
            SizedBox(
              width: 40,
              height: 30,
              child: Icon(Icons.circle_outlined),
            ),
          ],
        ),
        SizedBox(height: 10), // Espaçamento entre as linhas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 40,
              height: 30,
              child: Icon(Icons.circle_outlined),
            ),
            SizedBox(
              width: 40,
              height: 30,
              child: Icon(Icons.circle_outlined),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 40,
              height: 30,
              child: Icon(Icons.circle),
            ),
            SizedBox(
              width: 40,
              height: 30,
              child: Icon(Icons.circle_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
