import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';
import 'dart:convert';


class Passer with ChangeNotifier{
  String _token;
  final String _userId;
  int fase;

  Passer(
    this._token,
    this._userId,
    {this.fase = 0,
    }
  );
   void _passPhase1 (){
    fase = 2;
    notifyListeners();
  }

  
  Future<void> loadPhase(String token, String userId) async{

   final response = await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'));
    print(response.body);
    }

  Future<void> passPhase1( String token, String userId) async{

   if(fase <= 2){
    fase = 2;}
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'),
    body: jsonEncode({"fase":fase}),);
  }

}