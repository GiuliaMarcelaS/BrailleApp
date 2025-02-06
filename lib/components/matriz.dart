import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/ball.dart';

class Matriz extends StatefulWidget {
  Matriz({super.key});

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
  int indice = 0;

  void novaLetra() {
    final ball = Provider.of<Ball>(context, listen: false);

    setState(() {
      isClicked1 = false;
      isClicked2 = false;
      isClicked3 = false;
      isClicked4 = false;
      isClicked5 = false;
      isClicked6 = false;
      indice++;

      // Adiciona "_" na nova posição se ainda não existir
      if (indice >= ball.separaCaracteres.length) {
        ball.separaCaracteres.add('_');
      } else {
        ball.separaCaracteres[indice] = '_';
      }

      ball.notifyListeners();
    });
  }

  void letraAnterior() {
    final ball = Provider.of<Ball>(context, listen: false);

    if (indice > 0) {
      setState(() {
        ball.separaCaracteres[indice] = '';
        indice--;
        ball.notifyListeners();
      });
    }
  }

  void updateLetter() {
    final ball = Provider.of<Ball>(context, listen: false);
    final translatedLetter = cell_translator();

    if (indice < ball.separaCaracteres.length) {
      ball.separaCaracteres[indice] = translatedLetter.isEmpty ? '_' : translatedLetter;
      ball.notifyListeners();
    }
  }

  void toggleBall1() => setState(() {
    isClicked1 = !isClicked1;
    updateLetter();
  });

  void toggleBall2() => setState(() {
    isClicked2 = !isClicked2;
    updateLetter();
  });

  void toggleBall3() => setState(() {
    isClicked3 = !isClicked3;
    updateLetter();
  });

  void toggleBall4() => setState(() {
    isClicked4 = !isClicked4;
    updateLetter();
  });

  void toggleBall5() => setState(() {
    isClicked5 = !isClicked5;
    updateLetter();
  });

  void toggleBall6() => setState(() {
    isClicked6 = !isClicked6;
    updateLetter();
  });

  String cell_translator() {
    if (isClicked1 && !isClicked2 && !isClicked3 && !isClicked4 && !isClicked5 && !isClicked6) return 'a';
    if (isClicked1 && isClicked2 && !isClicked3 && !isClicked4 && !isClicked5 && !isClicked6) return 'b';
    if (isClicked1 && !isClicked2 && !isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 'c';
    if (isClicked1 && !isClicked2 && !isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 'd';
    if (isClicked1 && !isClicked2 && !isClicked3 && !isClicked4 && isClicked5 && !isClicked6) return 'e';
    if (isClicked1 && isClicked2 && !isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 'f';
    if (isClicked1 && isClicked2 && !isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 'g';
    if (isClicked1 && isClicked2 && !isClicked3 && !isClicked4 && isClicked5 && !isClicked6) return 'h';
    if (!isClicked1 && isClicked2 && !isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 'i';
    if (!isClicked1 && isClicked2 && !isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 'j';
    if (isClicked1 && !isClicked2 && isClicked3 && !isClicked4 && !isClicked5 && !isClicked6) return 'k';
    if (isClicked1 && isClicked2 && isClicked3 && !isClicked4 && !isClicked5 && !isClicked6) return 'l';
    if (isClicked1 && !isClicked2 && isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 'm';
    if (isClicked1 && !isClicked2 && isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 'n';
    if (isClicked1 && !isClicked2 && isClicked3 && !isClicked4 && isClicked5 && !isClicked6) return 'o';
    if (isClicked1 && isClicked2 && isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 'p';
    if (isClicked1 && isClicked2 && isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 'q';
    if (isClicked1 && isClicked2 && isClicked3 && !isClicked4 && isClicked5 && !isClicked6) return 'r';
    if (!isClicked1 && isClicked2 && isClicked3 && isClicked4 && !isClicked5 && !isClicked6) return 's';
    if (!isClicked1 && isClicked2 && isClicked3 && isClicked4 && isClicked5 && !isClicked6) return 't';
    if (isClicked1 && !isClicked2 && isClicked3 && !isClicked4 && !isClicked5 && isClicked6) return 'u';
    if (isClicked1 && isClicked2 && isClicked3 && !isClicked4 && !isClicked5 && isClicked6) return 'v';
    if (!isClicked1 && isClicked2 && !isClicked3 && isClicked4 && isClicked5 && isClicked6) return 'w';
    if (isClicked1 && !isClicked2 && isClicked3 && isClicked4 && !isClicked5 && isClicked6) return 'x';
    if (isClicked1 && !isClicked2 && isClicked3 && isClicked4 && isClicked5 && isClicked6) return 'y';
    if (isClicked1 && !isClicked2 && isClicked3 && !isClicked4 && isClicked5 && isClicked6) return 'z';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context);
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                if (indice > 0) {
                  ball.separaCaracteres[indice] = ''; // Remove apenas o último caractere
                  letraAnterior();
                  ball.notifyListeners();
                }
              },
              child: Text('Letra Anterior'),
            ),
            ElevatedButton(
              onPressed: novaLetra,
              child: Text('Nova Letra'),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: toggleBall1, icon: Icon(isClicked1 ? Icons.circle : Icons.circle_outlined)),
                IconButton(onPressed: toggleBall4, icon: Icon(isClicked4 ? Icons.circle : Icons.circle_outlined)),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: toggleBall2, icon: Icon(isClicked2 ? Icons.circle : Icons.circle_outlined)),
                IconButton(onPressed: toggleBall5, icon: Icon(isClicked5 ? Icons.circle : Icons.circle_outlined)),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: toggleBall3, icon: Icon(isClicked3 ? Icons.circle : Icons.circle_outlined)),
                IconButton(onPressed: toggleBall6, icon: Icon(isClicked6 ? Icons.circle : Icons.circle_outlined)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
