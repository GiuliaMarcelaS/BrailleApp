import 'dart:convert';
import 'package:braille_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cell with ChangeNotifier {
 // ignore: unused_field
 final String _token;
  // ignore: unused_field
  final String _userId;
  int linha;
  int coluna;
  bool isClicked1;
  bool isClicked2;
  bool isClicked3;
  bool isClicked4;
  bool isClicked5;
  bool isClicked6;

  Cell(
    this._token,
    this._userId,
    {
    this.linha = 1,
    this.coluna = 1,
    this.isClicked1 = false,
    this.isClicked2 = false,
    this.isClicked3 = false,
    this.isClicked4 = false,
    this.isClicked5 = false,
    this.isClicked6 = false,
  });

  // ignore: unused_element
  void _toggleBall1 (){
    isClicked1 = !isClicked1;
    notifyListeners();
  }

  
  Future<void> loadBall1(String token, String userId) async{

   final response = await http.put(
    Uri.parse('${Constants.TESTE2_URL}/$userId/teste.json?auth=$token'));
    // ignore: avoid_print
    print(response.body);
    }

  Future<void> toggleBall1(Cell cell, String token, String userId) async{

    isClicked1 = !isClicked1;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.TESTE2_URL}/$userId/teste.json?auth=$token'),
    body: jsonEncode({"isClicked1":isClicked1}),);

  }


  void toggleBall2(Cell cell){

    isClicked2 = !isClicked2;
    notifyListeners();
  }
   void toggleBall3(Cell cell){

    isClicked3 = !isClicked3;
    notifyListeners();
  }

   void toggleBall4(Cell cell){

    isClicked4 = !isClicked4;
    notifyListeners();
  }

   void toggleBall5(Cell cell){

    isClicked5 = !isClicked5;
    notifyListeners();
  }

   void toggleBall6(Cell cell){

    isClicked6 = !isClicked6;
    notifyListeners();
  }


}