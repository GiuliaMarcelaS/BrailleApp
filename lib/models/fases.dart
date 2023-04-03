import 'package:flutter/material.dart';

class Fase with ChangeNotifier{
  final String id;
  final String title;

  Fase({
    required this.id,
    required this.title,
  });
}