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
    final ball = Provider.of<Ball>(context);
    final cells = Provider.of<CellsList>(context);
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
        'Z',
        'Á',
        'É',
        'Í',
        'Ó',
        'Ú',
        'À',
        'Â',
        'Ê',
        'Ô',
        'Ã',
        'Õ',
        'Ç'
      ];
      List numerosMatrizes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      bool caplock = false;
      bool palavraMai = false;

      if (frase == frase.toUpperCase() && frase.length > 1) {
        frase = frase.toLowerCase();
        caplock = true;
      }

      List<String> palavras = frase.split(' ');

      for (int j = 0; j < palavras.length; j++) {
        String palavra = palavras[j];

        if (palavra == palavra.toUpperCase() &&
            palavra.length > 1 &&
            palavra.split('').every((char) => duasMatrizes.contains(char))) {
          palavra = palavra.toLowerCase();
          palavra = "AA$palavra";
          palavraMai = true;
        }

        for (int i = 0; i < palavra.length; i++) {
          if (caplock == true) {
            fraseAlterada = ":AA " + fraseAlterada;
            caplock = false;
          }

          if (duasMatrizes.contains(palavra[i]) && palavraMai == false) {
            fraseAlterada += 'A${palavra[i].toLowerCase()}';
          } else if (numerosMatrizes.contains(palavra[i]) &&
              (i == 0 || !numerosMatrizes.contains(palavra[i - 1]))) {
            fraseAlterada += 'B${palavra[i]}';
          } else if (palavra[i] == "'") {
            fraseAlterada += '."';
          } else if (palavra[i] == "<" || palavra[i] == ">") {
            fraseAlterada += '\$"';
          } else if (palavra[i] == "_") {
            fraseAlterada += "--";
          } else {
            fraseAlterada += palavra[i];
          }
        }
        if (j < palavras.length - 1) fraseAlterada += ' ';
      }
      return fraseAlterada;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Linha com a label e contador estilizados
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Português (PT/BR)", // Label no canto superior esquerdo
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                "${_controller.text.length}/$maxCharacters", // Contador no canto superior direito
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 200, // Define a altura desejada
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: TextField(
            controller: _controller,
            maxLength: maxCharacters,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: 'Escreva seu texto',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              counterText: "", // Remove o contador padrão
            ),
            onChanged: (valor) {
              setState(() {}); // Atualiza o contador quando o texto muda
            },
            onSubmitted: (valor) {
              cells.wordsClicker(auth.token ?? '', auth.userId ?? '');
              ball.reset(letra);
              letra = identifyUpperCase(valor);
              ball.translatePhrase(letra, cells.id);
              cells.addCells(letra);
              cells.id = 0;
              letra = "";
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.clear();
                setState(() {}); // Atualiza o contador quando o texto é limpo
              },
              child: Text(
                'Limpar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF208B52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
