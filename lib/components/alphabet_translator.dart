import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlphabetTranslator extends StatefulWidget {
  const AlphabetTranslator({super.key});

  @override
  State<AlphabetTranslator> createState() => _AlphabetTrabslatorState();
}

class _AlphabetTrabslatorState extends State<AlphabetTranslator> {
  String letra = '';

  //  refreshCells(BuildContext context,){
  //   return Provider.of<CellsList>(
  //     context,
  //     listen: false,
  //   ).addCells(letra, Ball());
  // }
  @override
  void initState() {
    super.initState();
    letra = " ";
  }
  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<AlphabetList>(context,);
    identifyUpperCase(String frase){
      String fraseAlterada ='';
       List duasMatrizes = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
      for(int i =0; i<frase.length; i++){
        if(duasMatrizes.contains(frase[i])){
          fraseAlterada ='A${frase[i].toLowerCase()}'; 
        }
        else{
          fraseAlterada=frase[i];
        }
      } return fraseAlterada;
    }
    return Column(
      children: [
        Form(
          child: TextField(
            maxLength: 1,
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              ball.reset(letra);
              letra = identifyUpperCase(valor);
              ball.translatePhrase(letra,cells.id);
              cells.addCells(letra);
              cells.id = 0;
              letra = "";
            },
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}