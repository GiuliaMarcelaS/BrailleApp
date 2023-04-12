import 'dart:convert';
import 'dart:math';

import 'package:braille_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cell with ChangeNotifier {
 String _token;
 // String? id;
  final String _userId;
  bool isClicked1;
  bool isClicked2;
  bool isClicked3;
  bool isClicked4;
  bool isClicked5;
  bool isClicked6;
//  String _token;

  Cell(
    this._token,
    this._userId,
    {
    //this.id,
    this.isClicked1 = false,
    this.isClicked2 = false,
    this.isClicked3 = false,
    this.isClicked4 = false,
    this.isClicked5 = false,
    this.isClicked6 = false,
  });

  void _toggleBall1 (){
    isClicked1 = !isClicked1;
    notifyListeners();
  }

  
  Future<void> loadBall1(String token, String userId) async{

   final response = await http.put(
    Uri.parse('${Constants.TESTE2_URL}/$userId/teste.json?auth=$token'));
    print(response.body);
    }

  Future<void> toggleBall1(Cell cell, String token, String userId) async{

    isClicked1 = !isClicked1;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.TESTE2_URL}/$userId/teste.json?auth=$token'),
    body: jsonEncode({"isClicked1":isClicked1}),);

    // final ball1Response = await http.get(
    //   Uri.parse('${Constants.BASE_URL}/$userId.json?auth=$token'),
    // );

    // Map<String, dynamic> ball1Data = ball1Response.body == 'null' ? {} : jsonDecode(ball1Response.body);
    
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