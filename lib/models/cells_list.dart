import 'dart:convert';

import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'package:http/http.dart' as http;


class CellsList with ChangeNotifier{
  final List<Ball> _items = [];

  List<Ball> get items => [..._items];

  final bool pressedBall1;
   int id;
  CellsList({
    this.pressedBall1 = false,
    this.id = 0,
  });

    clear(){
      _items.clear();
    }

    addCells(String frase){
      int phraseLength = frase.length;
      _items.clear();
      for(int i =0; i<phraseLength;i++)
      {
        _items.add(Ball());
      }
    notifyListeners();
  }

  addOneCell(String letra){
        _items.clear();
        _items.add(Ball());
        notifyListeners();
      }

  int numberOfClicks = 0;      
  Future <void> wordsClicker(String token, String userId) async{
    final response = await http.get(Uri.parse('${Constants.BASE_URL}/$userId/clicks_palavras.json?auth=$token'));
    numberOfClicks = jsonDecode(response.body);
    http.put(Uri.parse('${Constants.BASE_URL}/$userId/clicks_palavras.json?auth=$token'),
    body: jsonEncode(numberOfClicks+1));
    notifyListeners();
  }
}