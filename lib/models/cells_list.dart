import 'package:braille_app/data/cells_data.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/data/fases_data.dart';
import 'package:braille_app/data/balls_data.dart';

class CellsList with ChangeNotifier{
  List<Ball> _items = cellsData;

  List<Ball> get items => [..._items];
}