import 'package:braille_app/models/fases.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';
import 'dart:convert';


class Passer with ChangeNotifier{
  // ignore: unused_field
  final String _token;
  // ignore: unused_field
  final String _userId;
  int faseCompleta;

  Passer(
    this._token,
    this._userId,
    {this.faseCompleta = 1,
    }
  );
   // ignore: unused_element
   void incrementaFaset (Fase fase){
    faseCompleta = fase.id+1;
    notifyListeners();
  }


  Future<void> incrementaFase(Fase fase, String token, String userId) async{
    faseCompleta = fase.id+1;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'),
    body: jsonEncode({"fase":faseCompleta}),);
  }

}