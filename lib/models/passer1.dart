import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:flutter/material.dart';

class Passer1 with ChangeNotifier{
  Map<int, PasserItem> _item = {};

  Map<int, PasserItem> get item {
    return {..._item};
  }

 int get valorFaseCompleta  {
  int valor = 1;
  _item.forEach((key, passerItem) { 
    valor == passerItem.faseCompleta;
  });
  return valor;
 }

  void addFase(PasserItem passerItem){
    _item.update(passerItem.faseCompleta, (value)=> PasserItem(faseCompleta: value.faseCompleta + 1));
    notifyListeners();
  }

}