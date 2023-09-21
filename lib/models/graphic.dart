import 'dart:convert';

import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Graphic with ChangeNotifier {
  final String click;

  Graphic({
    this.click = '',
  });

  List<String> dias = [];
  num alphabet = 0;

   Future<void> getClicks(String token, String userId) async{
    alphabet = 0;
   final response = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/September.json?auth=$token"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
 // print(dados);
  dias.clear();
  dados.forEach((id, dados){
    dias.add(id);
  });
  print(dias);

  for(var dia in dias){
    final response2 = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/September/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
 //   print(dados2);
    alphabet += dados2['alfabeto'];

  }
  print(alphabet);
  notifyListeners();
}
}