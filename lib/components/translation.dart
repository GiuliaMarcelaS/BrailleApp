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
    final cells = Provider.of<CellsList>(context,);
    final auth = Provider.of<Auth>(context);

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
      ball.translatePhrase(letra, cells.id);
      cells.addCells(letra);
      cells.id = 0;
      letra = "";
    },
    controller: TextEditingController(),
  ),
)
      ],
    );
  }
}