import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:braille_app/components/matriz.dart';
import 'package:provider/provider.dart';


class F1 extends StatefulWidget {
   F1({super.key});

  @override
  State<F1> createState() => _F1State();
}

class _F1State extends State<F1> {
  void initState(){
    super.initState();
    Provider.of<Cell>(context, listen: false).loadBall1('', '');
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('célula'),
      ),
      body: Row(
        children: [
          Container(child: Matriz()),
        ],
      ),
    );
  }
}