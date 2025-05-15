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

     final sequenciaMinigames = {
    '1': [
      {
        'categoria': 'apresentar', 
        'padrao': 'padrao_1', 
        'tipo': MiniGameType.APRESENTAR,
        'temGrupo': false
      },
      {
        'categoria': 'reconhecer', 
        'padrao': 'padrao_1', 
        'grupo': 'a', 
        'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
        'temGrupo': true
      },
      {
        'categoria': 'diferenciar', 
        'padrao': 'padrao_1', 
        'tipo': MiniGameType.COMPLETAR_PALAVRA,
        'temGrupo': false
      },
    ],
  };
     final miniGames = <MiniGameTemplate>[];

  for (var config in sequenciaMinigames[faseId] ?? []) {
    CollectionReference collectionRef;
    
    if (config['temGrupo'] == true) {
      collectionRef = _firestore
          .collection('categorias')
          .doc(config['categoria'])
          .collection('padroes')
          .doc(config['padrao'])
          .collection('grupos')
          .doc(config['grupo'])
          .collection('questoes');
    } else {
      collectionRef = _firestore
          .collection('categorias')
          .doc(config['categoria'])
          .collection('padroes')
          .doc(config['padrao'])
          .collection('questoes');
    }

    final snapshot = await collectionRef.get();

    miniGames.addAll(snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return MiniGameTemplate(
        id: doc.id,
        type: config['tipo'] as MiniGameType,
        difficulty: 1,
        questao: QuestaoModel.fromMap(data, doc.id),
      );
    }));
  }

  return miniGames;
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