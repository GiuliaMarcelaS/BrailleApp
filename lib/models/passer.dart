import 'package:braille_app/models/fases.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';
import 'dart:convert';


class Passer with ChangeNotifier{
  String _token;
  String _userId;
  int faseCompleta;

  Passer(
    this._token,
    this._userId,
    {this.faseCompleta = 1,
    }
  );
   void _incrementaFase (Fase fase){
    faseCompleta = fase.id+1;
    notifyListeners();
  }

  
  Future<void> loadPhase(String token, String userId) async{

   final response = await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'));
    print(response.body);
    }

  Future<void> incrementaFase(Fase fase, String token, String userId) async{
    faseCompleta = fase.id+1;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'),
    body: jsonEncode({"fase":faseCompleta}),);
  }

}