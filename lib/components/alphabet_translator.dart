//OBS: A ABA DE TRADUÇÃO DE PALAVRAS ESTÁ MODIFICANDO A CÉLULA DESSA ABA
import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/auth.dart';

// classe responsável pela lógica da tradução da aba de  alfabeto

class AlphabetTranslator extends StatefulWidget {
  const AlphabetTranslator({super.key});

  @override
  State<AlphabetTranslator> createState() => _AlphabetTrabslatorState();
}

class _AlphabetTrabslatorState extends State<AlphabetTranslator> {
  String insertedLetter = '';

  @override
  Widget build(BuildContext context) {
    final ball = Provider.of<Ball>(context,);
    final cells = Provider.of<AlphabetList>(context,);
    final auth = Provider.of<Auth>(context);
    identifyUpperCase(String letter){
      String finalString ='';
       List upperCases = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
      for(int i =0; i<letter.length; i++){
        if(upperCases.contains(letter[i])){
          finalString ='A${letter[i].toLowerCase()}'; 
        }
        else{
          finalString=letter[i];
        }
      } return finalString;
    }// função que adiciona o caractere "A" à string (letra) inserida pelo usuário caso esta esteja presente na lista de maiúsculas, pois o caractere "A", dentro da função de tradução representa a célula de indicação de letra maiuscula em Braille
    return Column(
      children: [
        Form( // formulário para o usuário inserir a letra do alfabeto que deseja traduzir
          child: TextField(
            maxLength: 1, // tamanho da string inserida não pode passar de um, pois a aba traduz apenas uma letra por vez
            decoration: const InputDecoration(labelText: 'insira uma letra'),
            onSubmitted: (valor) {
              cells.alphabetClicker(auth.token??'', auth.userId??''); // função que envia ao banco de dados o número de vezes que o usuário utilizou a aba de tradução do alfabeto
              insertedLetter = identifyUpperCase(valor); 
              ball.translatePhrase(insertedLetter,cells.id);
              cells.addCells(insertedLetter);
            },
            controller: TextEditingController(), // remove do textfield a letra inserida anteriormente
          ),
        ),
      ],
    );
  }
}