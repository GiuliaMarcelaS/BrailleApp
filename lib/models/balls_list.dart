import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/data/fases_data.dart';
import 'package:braille_app/data/balls_data.dart';

class BallsList with ChangeNotifier{
  List<Ball> _items = ballsData;

  List<Ball> get items => [..._items];
}