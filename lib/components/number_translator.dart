import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:braille_app/models/number_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class NumberTranslator extends StatefulWidget {
  const NumberTranslator({super.key});

  @override
  State<NumberTranslator> createState() => _NumberTrabslatorState();
}

class _NumberTrabslatorState extends State<NumberTranslator> {
  String letra = '';

  //  refreshCells(BuildContext context,){
  //   return Provider.of<CellsList>(
  //     context,
  //     listen: false,
  //   ).addCells(letra, Ball());
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    letra = " ";
  }
  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<NumberList>(context,);
    final auth = Provider.of<Auth>(context);
    identifyUpperCase(String frase){
      String fraseAlterada ='A';
       List duasMatrizes = ['0','1','2','3','4','5','6','7','8','9'];
      for(int i =0; i<frase.length; i++){
        if(frase[i] == " "){
          fraseAlterada=fraseAlterada+frase[i]+"A";
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
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'insira um número'),
            onSubmitted: (valor) {
              cells.numberClicker(auth.token??'', auth.userId??'');
              ball.reset(letra);
              letra = identifyUpperCase(valor);
              ball.translateNumber(letra,cells.id);
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