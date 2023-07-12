import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlphabetTranslator extends StatefulWidget {
  const AlphabetTranslator({super.key});

  @override
  State<AlphabetTranslator> createState() => _TranslationState();
}

class _TranslationState extends State<AlphabetTranslator> {
  String letra = '';

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<CellsList>(context,);
    identifyUpperCase(String frase){
      String fraseAlterada ='';
       List duasMatrizes = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
      for(int i =0; i<frase.length; i++){
        if(duasMatrizes.contains(frase[i])){
          fraseAlterada = fraseAlterada +'A${frase[i].toLowerCase()}'; 
        }
        else{
          fraseAlterada=fraseAlterada+frase[i];
        }
      } return fraseAlterada;
    }
    return Column(
      children: [
        Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              ball.reset(letra);
              letra = valor;
              // letra = identifyUpperCase(valor);
              ball.cells(letra);
              cells.addOneCell(letra);
            },
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}