import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';

class Fase with ChangeNotifier{
  int fase;
  int id;
  final String title;
  bool faseHabilitada;

  Fase({
    this.fase = 1,
    this.id = 0,
    this.title = "",
    this.faseHabilitada = false,
    
  });
   
  //  Future <void> selecionaFase() async{
  //   fase = id+1;
  //   notifyListeners();

  //   await http.patch(
  //     Uri.parse("${Constants.TESTE2_URL}/fase/$id.json"),
  //     body: jsonEncode({"fase" : fase}),
  //   );}
   Future <void> habilitaFase() async{
    faseHabilitada = !faseHabilitada;
    notifyListeners();

    await http.patch(
      Uri.parse("${Constants.TESTE2_URL}/fase/$id.json"),
      body: jsonEncode({"faseHabilitada" : faseHabilitada}),
    );
   }

}