import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

class CellsList with ChangeNotifier{
  final List<Ball> _items = [];

  List<Ball> get items => [..._items];

    addCells(String frase){
      int phraseLength = frase.length;
      _items.clear();
      for(int i =0; i<phraseLength;i++)
      {
        _items.add(Ball(id: i+1));
      }
    notifyListeners();
  }
}