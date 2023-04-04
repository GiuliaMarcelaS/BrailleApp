import 'package:flutter/material.dart';

class Fase with ChangeNotifier{
  final String id;
  final String title;
  final int passer;

  Fase({
    required this.id,
    required this.title,
    required this.passer,
  });
}