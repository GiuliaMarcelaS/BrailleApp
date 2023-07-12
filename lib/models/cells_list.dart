import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

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
      //id = 0;
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
}