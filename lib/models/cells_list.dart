import 'package:braille_app/data/cells_data.dart';
import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

class CellsList with ChangeNotifier{
  final List<Ball> _items = cellsData;

  List<Ball> get items => [..._items];
}