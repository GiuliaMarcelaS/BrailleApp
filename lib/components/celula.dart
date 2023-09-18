// motra uma celúla interativa

import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OneCell extends StatefulWidget {
   const OneCell({super.key});

  @override
  State<OneCell> createState() => _OneCellState();
}

class _OneCellState extends State<OneCell> {
  @override
  void initState(){
    super.initState();
    Provider.of<Cell>(context, listen: false).loadBall1('', '');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('célula'),
      ),
      body: Row(
        children: const [
          Matriz(),
        ],
      ),
    );
  }
}