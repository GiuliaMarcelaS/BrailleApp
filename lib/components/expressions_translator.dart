import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/expressions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/auth.dart';

//Traduz aba de expressões matemáticas
class ExpressionsTranslator extends StatefulWidget {
  const ExpressionsTranslator({super.key});

  @override
  State<ExpressionsTranslator> createState() => _ExpressionsTranslatorState();
}

class _ExpressionsTranslatorState extends State<ExpressionsTranslator> {
  String letra = '';

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<ExpressionList>(context,);
    final auth = Provider.of<Auth>(context);
    identifyNumbers(String frase){
      String fraseAlterada ='A';
      List specialCharacters = ['*','/','+','-','='];
      //  List duasMatrizes = ['0','1','2','3','4','5','6','7','8','9'];
      for(int i =0; i<frase.length; i++){
        if(frase[i] == " "&&(specialCharacters.contains(frase[i+1])==false)){
          fraseAlterada="$fraseAlterada${frase[i]}A";
        } // adiciona a célula de indicação de números em Braille identificando se na string inserida há um espaço sucedido de um caractere não especial
        else{
          fraseAlterada=fraseAlterada+frase[i];
        }
      } return fraseAlterada;
    }
    return Column(
      children: [
        Form(
          child: TextField(
            decoration: const InputDecoration(labelText: 'insira uma expressão matemática'),
            onSubmitted: (valor) {
              cells.expressionsClicker(auth.token??'', auth.userId??'');
              letra = identifyNumbers(valor);
              ball.translateExpressions(letra,cells.id);
              cells.addCells(letra);
            },
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}