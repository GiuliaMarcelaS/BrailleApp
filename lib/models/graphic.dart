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
  List<String> dias10 = [];
  num alphabet = 0;
  num alphabet2 = 0;

   Future<void> getClicks(String token, String userId) async{
    alphabet = 0;
    alphabet2 = 0;
   final response = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/September.json?auth=$token"));
   final response10 = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/October.json?auth=$token"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  Map<dynamic, dynamic> dados10 = jsonDecode(response10.body);
 // print(dados);
  dias.clear();
  dados.forEach((id, dados){
    dias.add(id);
  });

  dias10.clear();
  dados10.forEach((id, dados){
    dias10.add(id);
  });
  print(dias);
  print(dias10);

  for(var dia in dias){
    final response2 = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/September/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
 //   print(dados2);
    alphabet += dados2['alfabeto'];

  }
  for(var dia in dias10){
    final response20 = await http.get(Uri.parse("${Constants.BASE_URL}/$userId/clicks/2023/October/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados20 = jsonDecode(response20.body);
 //   print(dados2);
    alphabet2 += dados20['alfabeto'];

  }
  notifyListeners();
}
}