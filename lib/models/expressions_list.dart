import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';
import 'package:intl/intl.dart';


class ExpressionList with ChangeNotifier{
  final List<Ball> _items = [];

  List<Ball> get items => [..._items];

  int id;
  ExpressionList({
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

  int numberOfClicks = 0;
  DateTime date = DateTime.now();
  String writtedDate = "";

    Future <void> expressionsClicker(String token, String userId) async{
    numberOfClicks++;
    writtedDate = DateFormat("yyyy/MMMM/dd").format(date);
    http.put(Uri.parse('${Constants.BASE_URL}/$userId/clicks/$writtedDate/expressões.json?auth=$token'),
    body: jsonEncode(numberOfClicks));
    notifyListeners();
  }
}