import 'package:flutter/material.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/ball.dart';

class Matriz extends StatefulWidget {
  bool cel1;
  bool cel2;
  bool cel3;
  bool cel4;
  bool cel5;
  bool cel6;
  int indice;

  Matriz({
    super.key,
    this.cel1 = false,
    this.cel2 = false,
    this.cel3 = false,
    this.cel4 = false,
    this.cel5 = false,
    this.cel6 = false,
    this.indice = 0,
  });

  @override
  State<Matriz> createState() => _MatrizState();
}

class _MatrizState extends State<Matriz> {
  bool isClicked1 = false;

  bool isClicked2 = false;

  bool isClicked3 = false;

  bool isClicked4 = false;

  bool isClicked5 = false;

  bool isClicked6 = false;

  void toggleBall1() {
    setState(() {
      isClicked1 = !isClicked1;
      cell_translator();
    });
  }

  void toggleBall2() {
    setState(() {
      isClicked2 = !isClicked2;
      cell_translator();
    });
  }

  void toggleBall3() {
    setState(() {
      isClicked3 = !isClicked3;
      cell_translator();
    });
  }

  void toggleBall4() {
    setState(() {
      isClicked4 = !isClicked4;
      cell_translator();
    });
  }

  void toggleBall5() {
    setState(() {
      isClicked5 = !isClicked5;
      cell_translator();
    });
  }

  void toggleBall6() {
    setState(() {
      isClicked6 = !isClicked6;
      cell_translator();
    });
  }

  List separaLetras = [];

  String cell_translator() {
    String letra = '';
    if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == false &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'a';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'b';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'c';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'd';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == false &&
        isClicked4 == false &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'e';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'f';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'g';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == false &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'h';
    } else if (isClicked1 == false &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'i';
    } else if (isClicked1 == false &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'j';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'k';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'l';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'm';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'n';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'o';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 'p';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'q';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 'r';
    } else if (isClicked1 == false &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = 's';
    } else if (isClicked1 == false &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == false) {
      letra = 't';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == true) {
      letra = 'u';
    } else if (isClicked1 == true &&
        isClicked2 == true &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == true) {
      letra = 'v';
    } else if (isClicked1 == false &&
        isClicked2 == true &&
        isClicked3 == false &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == true) {
      letra = 'w';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == false &&
        isClicked6 == true) {
      letra = 'x';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == true &&
        isClicked5 == true &&
        isClicked6 == true) {
      letra = 'y';
    } else if (isClicked1 == true &&
        isClicked2 == false &&
        isClicked3 == true &&
        isClicked4 == false &&
        isClicked5 == true &&
        isClicked6 == true) {
      letra = 'z';
    } else if (isClicked1 == false &&
        isClicked2 == false &&
        isClicked3 == false &&
        isClicked4 == false &&
        isClicked5 == false &&
        isClicked6 == false) {
      letra = '';
    }

    return letra;
  }

  @override
  Widget build(BuildContext context) {
    final cell = Provider.of<Cell>(context);
    final ball = Provider.of<Ball>(context);
    final auth = Provider.of<Auth>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  toggleBall1();
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked1 ? Icons.circle : Icons.circle_outlined,
                )),
            IconButton(
                onPressed: () {
                  toggleBall4();
                  print(widget.indice);
                  print(ball.aux);
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked4 ? Icons.circle : Icons.circle_outlined,
                )),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  toggleBall2();
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked2 ? Icons.circle : Icons.circle_outlined,
                )),
            IconButton(
                onPressed: () {
                  toggleBall5();
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked5 ? Icons.circle : Icons.circle_outlined,
                )),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  toggleBall3();
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked3 ? Icons.circle : Icons.circle_outlined,
                )),
            IconButton(
                onPressed: () {
                  toggleBall6();
                  ball.separaCaracteres[widget.indice] = cell_translator();
                  ball.notifyListeners();
                },
                icon: Icon(
                  isClicked6 ? Icons.circle : Icons.circle_outlined,
                )),
          ],
        ),
      ],
    );
  }
}
