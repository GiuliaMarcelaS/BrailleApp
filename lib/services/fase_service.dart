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
    // referência ao doc de padrão
    final padraoDocRef = _firestore
        .collection('categorias')
        .doc(config['categoria'] as String)
        .collection('padroes')
        .doc(config['padrao'] as String);

    // 1) Caso APRESENTAR, pega o próprio documento de padrão e cria o QuestaoModel “na mão”
    if (config['tipo'] == MiniGameType.APRESENTAR) {
      final docSnap = await padraoDocRef.get();
      if (docSnap.exists) {
        final data = docSnap.data()! as Map<String, dynamic>;
        // extrai o map de caracteres
        final caracteres = (data['caracteres'] as Map<dynamic, dynamic>?)
                ?.map((k, v) => MapEntry<String, String>(
                      k.toString(),
                      v.toString(),
                    )) ??
            {};
        // instância manual do QuestaoModel
        final questao = QuestaoModel(
          id: docSnap.id,
          caracteres: caracteres,
          // preencha outros campos que seu construtor exigir com defaults:
          enunciado: '',
          opcoes: const [],
          ordemCorreta: const [],
          posicoesLacunas: const [],
          dica: null,
          imagemUrl: null,
        );
        miniGames.add(MiniGameTemplate(
          id: docSnap.id,
          type: MiniGameType.APRESENTAR,
          difficulty: 1,
          questao: questao,
        ));
      }
      continue;
    }

    // 2) Caso não seja APRESENTAR, monta a subcoleção normalmente
    late CollectionReference ref;
    if (config.containsKey('grupo')) {
      ref = padraoDocRef
          .collection('grupos')
          .doc(config['grupo'] as String)
          .collection('questoes');
    } else {
      ref = padraoDocRef.collection('questoes');
    }

    // 3) Se houver ID específico, busca só ele
    if (config.containsKey('id')) {
      final docId = config['id'] as String;
      final docSnap = await ref.doc(docId).get();
      if (docSnap.exists) {
        final data = docSnap.data()! as Map<String, dynamic>;
        miniGames.add(MiniGameTemplate(
          id: docSnap.id,
          type: config['tipo'] as MiniGameType,
          difficulty: 1,
          questao: QuestaoModel.fromMap(data, docSnap.id),
        ));
      }
    } else {
      // 4) Senão, carrega toda a coleção de questões
      final snapshot = await ref.get();
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        miniGames.add(MiniGameTemplate(
          id: doc.id,
          type: config['tipo'] as MiniGameType,
          difficulty: 1,
          questao: QuestaoModel.fromMap(data, doc.id),
        ));
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
