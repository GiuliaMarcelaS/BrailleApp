import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';
import 'dart:convert';
import 'package:braille_app/models/fases.dart';

class Passer2 with ChangeNotifier{
  String _token;
  final String _userId;
  bool faseHabilitada;

  Passer2(
    this._token,
    this._userId,
  {
    this.faseHabilitada = false,
  }

  );
   void _habilitaFase (){
    faseHabilitada = !faseHabilitada;
    notifyListeners();
  }

   Future<void> loadFase(String token, String userId) async{

   final response = await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/teste2.json?auth=$token'));
    print(response.body);
    }

  Future<void> habilitaFase(Passer2 passer2, String token, String userId) async{

    faseHabilitada = !faseHabilitada;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/teste2.json?auth=$token'),
    body: jsonEncode({"faseHabilitada":faseHabilitada}),);
}}