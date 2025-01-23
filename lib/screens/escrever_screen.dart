import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EscreverScreen extends StatefulWidget {
  const EscreverScreen({super.key});

  @override
  State<EscreverScreen> createState() => _EscreverScreenState();
}

class _EscreverScreenState extends State<EscreverScreen> {
  List<Widget> matrizes = []; // Lista inicial vazia

  void _addMatriz() {
    setState(() {
      matrizes.add(Matriz(
        indice: matrizes.length,
      )); // Adiciona uma nova matriz à lista
    });
  }

  void _removeLastMatriz() {
    if (matrizes.isNotEmpty) {
      setState(() {
        matrizes.removeLast(); // Remove a última matriz da lista
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ball = Provider.of<Ball>(context);
    var cell = Provider.of<Cell>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escrever em Braille'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _addMatriz, // Adiciona uma nova matriz
                icon: const Icon(Icons.add_circle_outline_outlined),
              ),
              IconButton(
                onPressed: _removeLastMatriz, // Remove a última matriz
                icon: const Icon(Icons.remove_circle_outline),
                color: Colors.red,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Permite rolagem horizontal
              child: Row(
                children: matrizes
                    .map((matriz) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0), // Espaçamento entre matrizes
                          child: matriz,
                        ))
                    .toList(), // Renderiza todas as matrizes na lista
              ),
            ),
          ),
          Text(
            ball.separaCaracteres.join(''),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
