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
  bool maiuscula = false;
  String letraAtual = "_"; // Placeholder antes de submeter

  // Lógica para a célula Braille
  void novaLetra() {
    setState(() {
      isClicked1 = false;
      isClicked2 = false;
      isClicked3 = false;
      isClicked4 = false;
      isClicked5 = false;
      isClicked6 = false;
      letraAtual = "_"; // Reseta a letra antes de submeter
    });
  }

  void submeterLetra() {
    final ball = Provider.of<Ball>(context, listen: false);
    final translatedLetter = cell_translator();

    setState(() {
      if (indice >= ball.separaCaracteres.length) {
        ball.separaCaracteres
            .add(translatedLetter.isEmpty ? '_' : translatedLetter);
      } else {
        ball.separaCaracteres[indice] =
            translatedLetter.isEmpty ? '_' : translatedLetter;
      }

      ball.notifyListeners();
      indice++; // Avança para a próxima posição após submeter
      novaLetra(); // Reseta os botões
    });
  }

  void voltarLetra() {
    final ball = Provider.of<Ball>(context, listen: false);
    if (indice > 0) {
      setState(() {
        indice--; // Volta um caractere
        ball.separaCaracteres[indice] = "_"; // Reseta a posição anterior
        ball.notifyListeners();
        novaLetra(); // Reseta os botões
      });
    }
  }

  void limpar() {
    final ball = Provider.of<Ball>(context, listen: false);
    setState(() {
      ball.separaCaracteres = List<String>.from(['_']); // Reinicia corretamente
      isClicked1 = false;
      isClicked2 = false;
      isClicked3 = false;
      isClicked4 = false;
      isClicked5 = false;
      isClicked6 = false;
      indice = 0;
      ball.notifyListeners();
    });
  }

  void toggleBall1() => setState(() => isClicked1 = !isClicked1);
  void toggleBall2() => setState(() => isClicked2 = !isClicked2);
  void toggleBall3() => setState(() => isClicked3 = !isClicked3);
  void toggleBall4() => setState(() => isClicked4 = !isClicked4);
  void toggleBall5() => setState(() => isClicked5 = !isClicked5);
  void toggleBall6() => setState(() => isClicked6 = !isClicked6);

  void habilitaMaiuscula() => setState(() => maiuscula = !maiuscula);

  String cell_translator() {
    // Lógica para tradução dos caracteres (como no código original)
    if (isClicked1 &&
        !isClicked2 &&
        !isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'A' : 'a';
    }
    if (isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'B' : 'b';
    }
    if (isClicked1 &&
        !isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'C' : 'c';
    }
    if (isClicked1 &&
        !isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'D' : 'd';
    }
    if (isClicked1 &&
        !isClicked2 &&
        !isClicked3 &&
        !isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'E' : 'e';
    }
    if (isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'F' : 'f';
    }
    if (isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'G' : 'g';
    }
    if (isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        !isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'H' : 'h';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'I' : 'i';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'J' : 'j';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'K' : 'k';
    }
    if (isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'L' : 'l';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'M' : 'm';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'N' : 'n';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'O' : 'o';
    }
    if (isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'P' : 'p';
    }
    if (isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'Q' : 'q';
    }
    if (isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'R' : 'r';
    }
    if (!isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'S' : 's';
    }
    if (!isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return maiuscula ? 'T' : 't';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'U' : 'u';
    }
    if (isClicked1 &&
        isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'V' : 'v';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        isClicked6) {
      return maiuscula ? 'W' : 'w';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'X' : 'x';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Y' : 'y';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        !isClicked4 &&
        isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Z' : 'z';
    }
    // if (isClicked1 &&
    //     !isClicked2 &&
    //     !isClicked3 &&
    //     !isClicked4 &&
    //     !isClicked5 &&
    //     !isClicked6) {
    //   return '1';
    // }
    // if (!isClicked1 &&
    //     !isClicked2 &&
    //     isClicked3 &&
    //     isClicked4 &&
    //     isClicked5 &&
    //     isClicked6) {
    //   return '2';
    // }
    // if (isClicked1 &&
    //     !isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     !isClicked5 &&
    //     !isClicked6) {
    //   return '3';
    // }
    // if (isClicked1 &&
    //     !isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     isClicked5 &&
    //     !isClicked6) {
    //   return '4';
    // }
    // if (isClicked1 &&
    //     !isClicked2 &&
    //     !isClicked3 &&
    //     !isClicked4 &&
    //     isClicked5 &&
    //     !isClicked6) {
    //   return '5';
    // }
    // if (isClicked1 &&
    //     isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     !isClicked5 &&
    //     !isClicked6) {
    //   return '6';
    // }
    // if (isClicked1 &&
    //     isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     isClicked5 &&
    //     !isClicked6) {
    //   return '7';
    // }
    // if (isClicked1 &&
    //     isClicked2 &&
    //     !isClicked3 &&
    //     !isClicked4 &&
    //     isClicked5 &&
    //     !isClicked6) {
    //   return '8';
    // }
    // if (!isClicked1 &&
    //     isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     !isClicked5 &&
    //     !isClicked6) {
    //   return '9';
    // }
    // if (!isClicked1 &&
    //     isClicked2 &&
    //     !isClicked3 &&
    //     isClicked4 &&
    //     isClicked5 &&
    //     !isClicked6) {
    //   return '0';
    // }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '*';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '-';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '+';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '/';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '=';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return '(';
    }
    if (!isClicked1 &&
        isClicked2 &&
        !isClicked3 &&
        isClicked4 &&
        isClicked5 &&
        !isClicked6) {
      return ')';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Á' : 'Á';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'É' : 'é';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Í' : 'í';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ó' : 'ó';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ú' : 'ú';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'À' : 'à';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Â' : 'â';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ê' : 'ê';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ô' : 'ô';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ã' : 'ã';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Õ' : 'õ';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return maiuscula ? 'Ç' : 'ç';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return ',';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return ';';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return ':';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '.';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '?';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '!';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '&';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '|';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '>';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '<';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '°';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '"';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '\$';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return '[';
    }
    if (isClicked1 &&
        !isClicked2 &&
        isClicked3 &&
        isClicked4 &&
        !isClicked5 &&
        isClicked6) {
      return ']';
    }
    if (!isClicked1 &&
        !isClicked2 &&
        !isClicked3 &&
        !isClicked4 &&
        !isClicked5 &&
        !isClicked6) {
      return ' ';
    }
    // ... o restante da lógica continua igual para os outros caracteres Braille
    return "";
  }

  bool espelhado = false;

  void habilitaReglete(){
    setState(() {
    espelhado = !espelhado;
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return Row(
    //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
             SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: habilitaMaiuscula,
                  icon: Icon(Icons.arrow_circle_up_sharp),
                ),
            ElevatedButton(onPressed: (){ habilitaReglete();}, child: Text('reglete')),
              ],
            ),
            SizedBox(width: 60,),
            // Matriz para exibir os botões de Braille
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                espelhado?
                Text('4', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('1', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),),
                espelhado?
                IconButton(
                    onPressed: toggleBall4,
                    icon: Icon(isClicked4 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall1,
                    icon: Icon(isClicked1 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                IconButton(
                    onPressed: toggleBall1,
                    icon: Icon(isClicked1 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall4,
                    icon: Icon(isClicked4 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                Text('1', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('4', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),)
              ],
            ),
            // Adiciona os outros botões de Braille
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                espelhado?
                Text('5', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('2', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),),
                espelhado?
                IconButton(
                    onPressed: toggleBall5,
                    icon: Icon(isClicked5 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall2,
                    icon: Icon(isClicked2 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                IconButton(
                    onPressed: toggleBall2,
                    icon: Icon(isClicked2 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall5,
                    icon: Icon(isClicked5 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                Text('2', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('5', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 espelhado?
                Text('6', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('3', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),),
                espelhado?
                IconButton(
                    onPressed: toggleBall6,
                    icon: Icon(isClicked6 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall3,
                    icon: Icon(isClicked3 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                IconButton(
                    onPressed: toggleBall3,
                    icon: Icon(isClicked3 ? Icons.circle : Icons.circle_outlined)):
                IconButton(
                    onPressed: toggleBall6,
                    icon: Icon(isClicked6 ? Icons.circle : Icons.circle_outlined)),
                espelhado?
                Text('3', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),):
                Text('6', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 112, 105, 105)),)
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
         SizedBox(width: 50,),
         IconButton(
                  onPressed: submeterLetra,
                  icon: Icon(Icons.arrow_forward_rounded),
                ),
      ],
    );
  }
}
