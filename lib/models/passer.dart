import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/topico.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';
import 'dart:convert';

class Passer with ChangeNotifier {
  // ignore: unused_field
  final String _token;
  // ignore: unused_field
  final String _userId;
  int faseCompleta;
  int topicoCompleto;
  num fracao;
  num fracaoT;

  Passer(
    this._token,
    this._userId, {
    this.faseCompleta = 1,
    this.topicoCompleto = 1,
    this.fracao = 0,
    this.fracaoT = 0,
  });

  void incrementaFaset(Fase fase, Topico topico, String token, String userId) {
    faseCompleta = fase.id + 1;
    notifyListeners();
  }

  void incrementaTopico(Topico topico) {
    topicoCompleto = topico.id + 1;
    notifyListeners();
  }

  void incrementaFracao(
      Passer passer, Topico topico, Fase fase, String token, String userId) {
    fracaoT += 1;
    topico.avanco += 1;
    fracao+=1;
    salvaTela(topico, token, userId);
    salvaTelaTopico(fase, token, userId);
    notifyListeners();
  }

  Future<void> getModulo(String token, String userId) async {
    final response = await http.get(Uri.parse(
        "${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token"));
    var dados = jsonDecode(response.body);
    faseCompleta = dados['modulo'];
    notifyListeners();
    print(faseCompleta);
  }

  Future<void> getTelaM(String token, String userId) async {
    final response = await http.get(Uri.parse(
        "${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token"));
    var dados = jsonDecode(response.body);
    fracao = dados['tela'];
    notifyListeners();
  }

  Future<void> getTelaT(Fase fase, String token, String userId) async {
    fracaoT = 0;
    final response = await http.get(Uri.parse(
        "${Constants.BASE_URL}/users/$userId/modulos/${(fase.id).toString()}.json?auth=$token"));
    var dados = jsonDecode(response.body);
    print("oi ${dados['telaT']}");
    fracaoT = dados['telaT'];
    notifyListeners();
  }

  Future<void> getTopico(String token, String userId) async {
    final response = await http.get(Uri.parse(
        "${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token"));
    var dados = jsonDecode(response.body);
    topicoCompleto = dados['topico'];
    notifyListeners();
    print(faseCompleta);
  }

  Future<void> incrementaFase(Fase fase, String token, String userId) async {
    faseCompleta = fase.id + 1;
    notifyListeners();
    await http.put(
      Uri.parse('${Constants.BASE_URL}/$userId/fase.json?auth=$token'),
      body: jsonEncode({"fase": faseCompleta}),
    );
  }

  Future<void> salvaTopico(Topico topico, String token, String userId) async {
    await http.patch(
      Uri.parse('${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token'),
      body: jsonEncode({"topico": topicoCompleto}),
    );
    notifyListeners();
  }

  Future<void> salvaModulo(Fase fase, String token, String userId) async {
    await http.patch(
      Uri.parse('${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token'),
      body: jsonEncode({"modulo": faseCompleta}),
    );
    notifyListeners();
  }

  Future<void> salvaTela(Topico topico, String token, String userId) async {
    await http.patch(
      Uri.parse('${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token'),
      body: jsonEncode({"tela": fracao}),
    );
    notifyListeners();
  }

  Future<void> salvaTelaTopico(Fase fase, String token, String userId) async {
    await http.patch(
      Uri.parse(
          '${Constants.BASE_URL}/users/$userId/modulos/${fase.id}.json?auth=$token'),
      body: jsonEncode({"telaT": fracaoT}),
    );
    notifyListeners();
  }

  Future<void> salvaAcerto(Fase fase, Topico topico, String token,
      String userId, int acertos) async {
    await http.patch(
      Uri.parse(
          '${Constants.BASE_URL}/users/$userId/modulos/${fase.id}/${topico.id}.json?auth=$token'),
      body: jsonEncode({"acertos": "$acertos/${topico.perguntas.length}"}),
    );
    notifyListeners();
  }
}
