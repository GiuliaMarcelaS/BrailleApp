import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

class AlphabetList with ChangeNotifier{
  final List<Ball> _items = [];

  List<Ball> get items => [..._items];

  int id;
  AlphabetList({
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
}