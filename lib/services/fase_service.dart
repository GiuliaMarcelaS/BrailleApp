import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';

class FaseService {
  final String token;
  final String userId;

  FaseService({required this.token, required this.userId});

  Future<int> getFaseAtual() async {
    final response = await http.get(
      Uri.parse('${Constants.BASE_URL}/users/$userId/fase.json?auth=$token'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data ?? 1;
    } else {
      throw Exception('Erro ao carregar fase atual');
    }
  }

  Future<void> atualizarFase(int novaFase) async {
    await http.put(
      Uri.parse('${Constants.BASE_URL}/users/$userId/fase.json?auth=$token'),
      body: jsonEncode(novaFase),
    );
  }
}
