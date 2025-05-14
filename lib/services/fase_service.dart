import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/components/fase.dart';
import 'package:braille_app/models/minigame_model.dart';
import 'package:braille_app/models/questao_model.dart';
import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';

class FaseService {
  final String token;
  final String userId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<Fase> carregarFasePorId(String id) async {
    // Fases são locais, então esse método só é usado no Retry
    throw UnimplementedError('Fase vem de dados locais');
  }

  Future<Fase> buscarFasePorMiniGameId(String miniGameId) async {
    throw UnimplementedError('Busca de fase por minigame não usada com fases locais');
  }

  Future<List<MiniGameTemplate>> carregarMiniGamesDaFase(String faseId) async {
    // Associa faseId a uma combinação fixa por enquanto (você pode mapear por id depois)
    String categoria = 'reconhecer';
    String padrao = 'padrao_1';
    String grupo = 'a';

    final snapshot_reconhecer = await _firestore
        .collection('categorias')
        .doc(categoria)
        .collection('padroes')
        .doc(padrao)
        .collection('grupos')
        .doc(grupo)
        .collection('questoes')
        .get();
        

    print('➡️ Buscando minigames de $categoria/$padrao');
    print('➡️ Encontrados: ${snapshot_reconhecer.docs.length} questoes');

    return snapshot_reconhecer.docs.map((doc) {
      final data = doc.data();
      final questao = QuestaoModel.fromMap(data, data['id']);

      return MiniGameTemplate(
        id: doc.id,
        type: MiniGameType.MULTIPLE_LETRAS_LINHA, // fixo por agora
        difficulty: 1,
        questao: questao,
      );
    }).toList();
  }

  MiniGameType _getMiniGameType(String value) {
    switch (value) {
      case 'letras_linha':
        return MiniGameType.MULTIPLE_LETRAS_LINHA;
      default:
        throw Exception('Tipo de minigame desconhecido: $value');
    }
  }

  Color _parseColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  Future<List<Fase>> carregarTodasAsFases() async {
    throw UnimplementedError('Fases são locais');
  }
}
