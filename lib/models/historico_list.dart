import 'dart:convert';

import 'package:braille_app/models/historico.dart';
import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoricoList with ChangeNotifier {
  String _token;
  String _userId;

  HistoricoList(this._token, this._userId);

  final List<Historico> _items = [];

  List<Historico> get items => [..._items];

  Future<void> carregaHistorico(String token, String userId) async {
    final response = await http.get(Uri.parse(
        '${Constants.BASE_URL}/users/$userId/historico/.json?auth=$token'));
    Map<dynamic, dynamic> dados = jsonDecode(response.body);
    _items.clear();

    dados.forEach((id, dados) {
      _items.add(Historico(
          id: id,
          data: dados["data"],
          textoPortugues: dados["textoPortugues"],
          textoBraille: dados["textoBraille"]));
    });
    notifyListeners();
  }

  Future<void> salvaHistorico(String token, String userId, String data,
      String historicoPt, String historicoBr) async {
    http.post(
        Uri.parse(
            "${Constants.BASE_URL}/users/$userId/historico/.json?auth=$token"),
        body: jsonEncode({
          'data': data,
          'textoPortugues': historicoPt,
          'textoBraille': historicoBr
        }));
    notifyListeners();
  }
}
