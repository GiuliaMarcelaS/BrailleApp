import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/auth.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  String letra = '';
  final TextEditingController _controller = TextEditingController();
  final int maxCharacters = 500;

  @override
  void initState() {
    super.initState();
    letra = " ";
  }

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(
      context,
    );
    final cells = Provider.of<CellsList>(
      context,
    );
    final auth = Provider.of<Auth>(context);

    identifyUpperCase(String frase) {
      String fraseAlterada = '';
      List duasMatrizes = [
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z'
      ];
      List numerosMatrizes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      bool caplock = false;
      if (frase == frase.toUpperCase() && frase.length > 1) {
        frase = frase.toLowerCase();
        caplock = true;
      }
      for (int i = 0; i < frase.length; i++) {
        if (caplock == true) {
          fraseAlterada = ":AA" + fraseAlterada;
          caplock = false;
        }
        if (duasMatrizes.contains(frase[i])) {
          fraseAlterada = fraseAlterada + 'A${frase[i].toLowerCase()}';
        } else if (numerosMatrizes.contains(frase[i]) &&
            (i == 0 || numerosMatrizes.contains(frase[i - 1]) == false)) {
          fraseAlterada = fraseAlterada + 'B${frase[i]}';
        } else if (frase[i] == "'") {
          fraseAlterada += '."';
        } else if (frase[i] == "<" || frase[i] == ">") {
          fraseAlterada += '\$"';
        } else if (frase[i] == "_") {
          fraseAlterada += "--";
        } else {
          fraseAlterada = fraseAlterada + frase[i];
        }
      }
      return fraseAlterada;
    }

    return Column(
      children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                maxLength: maxCharacters,
                decoration: InputDecoration(
                  labelText: 'Escreva seu texto',
                  hintText: 'Escreva seu texto',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                onSubmitted: (valor) {
                  cells.wordsClicker(auth.token ?? '', auth.userId ?? '');
                  ball.reset(letra);
                  letra = identifyUpperCase(valor);
                  print(letra);
                  ball.translatePhrase(letra, cells.id);
                  print(letra.length);
                  cells.addCells(letra);
                  cells.id = 0;
                  letra = "";
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}