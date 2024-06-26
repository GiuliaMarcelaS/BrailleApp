import 'dart:convert';

import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Information1 with ChangeNotifier{
  Future <void> saveInformation1(String token, String userId, int selected) async{
    http.put(Uri.parse('${Constants.BASE_URL}/users/$userId/dados.json?auth=$token'),
    body: jsonEncode({"nível de entendimento":selected}));
    notifyListeners();
  }

  Future <void> saveInformation2(String token, String userId, bool selected1, bool selected2, bool selected3) async{
    http.put(Uri.parse('${Constants.BASE_URL}/users/$userId/dados/interesse.json?auth=$token'),
    body: jsonEncode({"Traduzir caracteres":selected1, 'Aprender':selected2, 'Praticar':selected3}));
    notifyListeners();
  }
}