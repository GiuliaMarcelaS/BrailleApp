import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/topico.dart';
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
  int topicoCompleto;
  num fracao;

  Passer(
    this._token,
    this._userId,
    {this.faseCompleta = 1,
    this.topicoCompleto = 1,
    this.fracao = 0
    }
  );
   // ignore: unused_element
   void incrementaFaset (Fase fase){
    faseCompleta = fase.id+1;
    notifyListeners();
  }
   void incrementaTopico (Topico topico){
    topicoCompleto = topico.id+1;
    notifyListeners();
  }
  void incrementaFracao (Passer passer){
    fracao+=1;
    notifyListeners();
  }

  Future<void> getModulo(String token, String userId) async{
    final response = await http.get(Uri.parse("${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token"));
    var dados = jsonDecode(response.body);
    faseCompleta = dados;
    notifyListeners();
    print(faseCompleta);
  }


  Future<void> incrementaFase(Fase fase, String token, String userId) async{
    faseCompleta = fase.id+1;
    notifyListeners();
    await http.put(
    Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'),
    body: jsonEncode({"fase":faseCompleta}),);
  }

}