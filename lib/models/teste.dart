
import 'dart:convert';

import 'package:braille_app/models/ball.dart';
import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//teste
class Teste with ChangeNotifier{

  Future <void> teste(String token, String userId) async{
    final response = await http.get(Uri.parse("${Constants.BASE_URL}/users.json?auth=$token"));
    Map<dynamic, dynamic> dados = jsonDecode(response.body);

    //print(dados);

    dados.forEach((id, dados){
    //  print(id);  
    });
    notifyListeners();
  }
}