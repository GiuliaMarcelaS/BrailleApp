import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/data/balls_data.dart';

class BallsList with ChangeNotifier{
  final List<Ball> _items = ballsData;

  List<Ball> get items => [..._items];
}