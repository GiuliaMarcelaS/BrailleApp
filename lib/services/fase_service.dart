import 'dart:convert';

import 'package:braille_app/data/minigames_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:braille_app/components/fase.dart';
import 'package:braille_app/models/minigame_model.dart';
import 'package:braille_app/models/questao_model.dart';
import 'package:braille_app/utils/constants.dart';

class FaseService {
  final String token;
  final String userId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FaseService({required this.token, required this.userId});

  // ---------------------------------------------------------------------------
  // Firebase Realtime DB helpers
  // ---------------------------------------------------------------------------

  Future<int> getFaseAtual() async {
    final url = '${Constants.BASE_URL}/users/$userId/fase.json?auth=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as int?) ?? 1;
    } else {
      throw Exception('Erro ao carregar fase atual');
    }
  }

  Future<void> atualizarFase(int novaFase) async {
    final url = '${Constants.BASE_URL}/users/$userId/fase.json?auth=$token';
    await http.put(Uri.parse(url), body: jsonEncode(novaFase));
  }

  // ---------------------------------------------------------------------------
  // Local-only helpers
  // ---------------------------------------------------------------------------

  Future<Fase> carregarFasePorId(String id) async {
    throw UnimplementedError('Fase vem de dados locais');
  }

  Future<Fase> buscarFasePorMiniGameId(String miniGameId) async {
    throw UnimplementedError();
  }

  // ---------------------------------------------------------------------------
  // MiniGames
  // ---------------------------------------------------------------------------

  Future<List<MiniGameTemplate>> carregarMiniGamesDaFase(String faseId) async {
    final miniGames = <MiniGameTemplate>[];
    final configs = sequenciaMinigames[faseId] ?? [];

    for (var config in configs) {
      // Monta referência de coleção
      late CollectionReference ref;
      if (config.containsKey('grupo')) {
        ref = _firestore
            .collection('categorias')
            .doc(config['categoria'] as String)
            .collection('padroes')
            .doc(config['padrao'] as String)
            .collection('grupos')
            .doc(config['grupo'] as String)
            .collection('questoes');
      } else {
        ref = _firestore
            .collection('categorias')
            .doc(config['categoria'] as String)
            .collection('padroes')
            .doc(config['padrao'] as String)
            .collection('questoes');
      }

      // Se houver 'id', busca apenas aquela questão
      if (config.containsKey('id')) {
        final docId = config['id'] as String;
        final docSnap = await ref.doc(docId).get();
        if (docSnap.exists) {
          final data = docSnap.data() as Map<String, dynamic>;
          miniGames.add(
            MiniGameTemplate(
              id: docSnap.id,
              type: config['tipo'] as MiniGameType,
              difficulty: 1,
              questao: QuestaoModel.fromMap(data, docSnap.id),
            ),
          );
        }
      } else {
        // Caso contrário, carrega toda a coleção
        final snapshot = await ref.get();
        for (var doc in snapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          miniGames.add(
            MiniGameTemplate(
              id: doc.id,
              type: config['tipo'] as MiniGameType,
              difficulty: 1,
              questao: QuestaoModel.fromMap(data, doc.id),
            ),
          );
        }
      }
    }

    return miniGames;
  }

  // ---------------------------------------------------------------------------
  // Utilitários
  // ---------------------------------------------------------------------------

  MiniGameType _getMiniGameType(String value) {
    switch (value) {
      case 'apresentar':
        return MiniGameType.APRESENTAR;
      case 'letras_linha':
        return MiniGameType.MULTIPLE_LETRAS_LINHA;
      case 'completar_palavra':
        return MiniGameType.COMPLETAR_PALAVRA;
      default:
        throw Exception('Tipo de minigame desconhecido: $value');
    }
  }

  Color _parseColor(String hex) {
    var colorStr = hex.replaceAll('#', '');
    if (colorStr.length == 6) colorStr = 'FF$colorStr';
    return Color(int.parse(colorStr, radix: 16));
  }

  Future<List<Fase>> carregarTodasAsFases() async {
    throw UnimplementedError('Fases são locais');
  }
}
