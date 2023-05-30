import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/data/fases_data.dart';

class FaseList with ChangeNotifier{
  final List<Fase> _items = fasesData;

  List<Fase> get items => [..._items];

  void addFase(Fase fase){
    _items.add(fase);
    notifyListeners();
  }
}