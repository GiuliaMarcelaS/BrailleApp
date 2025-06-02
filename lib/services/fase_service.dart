import 'dart:convert';
import 'dart:math';

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

  /// Retorna a fase atual (ou 1, se não existir)
  Future<int> getFaseAtual() async {
    final url = '${Constants.BASE_URL}/users/$userId/fase.json?auth=$token';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final faseArmazenada = (data as int?) ?? 1;
      debugPrint('[FaseService] fase atual no DB = $faseArmazenada');
      return faseArmazenada;
    } else {
      throw Exception('Erro ao carregar fase atual');
    }
  }

  /// Atualiza somente se [novaFase] for maior que a fase atual
  Future<void> atualizarFase(int novaFase) async {
    try {
      final faseAtual = await getFaseAtual();
      debugPrint(
          '[FaseService] tentativa de atualizar para fase $novaFase (atualmente é $faseAtual)');

      if (novaFase > faseAtual) {
        final url = '${Constants.BASE_URL}/users/$userId/fase.json?auth=$token';
        final response =
            await http.put(Uri.parse(url), body: jsonEncode(novaFase));
        if (response.statusCode == 200) {
          debugPrint('[FaseService] fase atualizada para $novaFase com sucesso.');
        } else {
          debugPrint(
              '[FaseService] falha ao atualizar fase. Código HTTP: ${response.statusCode}');
        }
      } else {
        debugPrint(
            '[FaseService] não atualiza (novaFase <= faseAtual), mantido em $faseAtual.');
      }
    } catch (e) {
      debugPrint('Falha ao tentar atualizar fase: $e');
    }
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

  /// Carrega minigames de [faseId] sempre na ordem definida em [sequenciaMinigames].
  /// Para cada config de tipo MULTIPLE_LETRAS_LINHA (reconhecer), escolhe aleatoriamente
  /// 3 questões daquele grupo.
  Future<List<MiniGameTemplate>> carregarMiniGamesDaFase(
      String faseId) async {
    final miniGames = <MiniGameTemplate>[];
    final configs = sequenciaMinigames[faseId] ?? [];
    final random = Random();

    for (var config in configs) {
      // 1) Referência ao doc “padroes/{padrao}”
      final padraoDocRef = _firestore
          .collection('categorias')
          .doc(config['categoria'] as String)
          .collection('padroes')
          .doc(config['padrao'] as String);

      // 2) Se for APRESENTAR e tiver 'direct': true, busca diretamente no doc
      if (config['tipo'] == MiniGameType.APRESENTAR &&
          (config['direct'] == true)) {
        final docSnap = await padraoDocRef.get();
        if (docSnap.exists) {
          final data = docSnap.data()! as Map<String, dynamic>;
          final caracteres =
              (data['caracteres'] as Map<dynamic, dynamic>?)?.map(
                    (k, v) => MapEntry(k.toString(), v.toString()),
                  ) ??
                  {};

          // Constrói QuestaoModel manualmente (não usa fromMap, pois o esquema do "apresentar" pode ser diferente)
          final questao = QuestaoModel(
            id: docSnap.id,
            enunciado: data['enunciado']?.toString(),
            opcoes:
                data['opcoes'] != null ? List<String>.from(data['opcoes']) : null,
            corretas:
                data['corretas'] != null ? List<int>.from(data['corretas']) : null,
            caracteres: caracteres,
            imagemUrl: data['imagemUrl']?.toString(),
            palavra: data['palavra']?.toString(),
            dica: data['dica']?.toString(),
            lacunas: data['lacunas'] != null
                ? (data['lacunas'] as List<dynamic>)
                    .map((e) => int.tryParse(e.toString()) ?? 0)
                    .toList()
                : null,
            ordemCorreta: data['ordem_correta'] != null
                ? (data['ordem_correta'] as List<dynamic>)
                    .map((e) => int.tryParse(e.toString()) ?? 0)
                    .toList()
                : null,
            posicoesLacunas: data['posicoesLacunas'] != null
                ? (data['posicoesLacunas'] as List<dynamic>)
                    .map((e) => int.tryParse(e.toString()) ?? 0)
                    .toList()
                : null,
          );

          miniGames.add(MiniGameTemplate(
            id: docSnap.id,
            type: MiniGameType.APRESENTAR,
            difficulty: 1,
            questao: questao,
          ));
        }
        continue; // pula para o próximo config sem ir à subcoleção
      }

      // 3) Caso não seja “apresentar”, monta a referência à subcoleção “questoes” ou “grupos/{g}/questoes”
      late CollectionReference ref;
      if (config.containsKey('grupo')) {
        ref = padraoDocRef
            .collection('grupos')
            .doc(config['grupo'] as String)
            .collection('questoes');
      } else {
        ref = padraoDocRef.collection('questoes');
      }

      // 4) Se for MULTIPLE_LETRAS_LINHA (reconhecer), fazemos o sorteio de 3 questões
      if (config['tipo'] == MiniGameType.MULTIPLE_LETRAS_LINHA) {
        final snapshot = await ref.get();
        final allDocs = snapshot.docs.toList();

        if (allDocs.isNotEmpty) {
          // Embaralha e pega até 3
          allDocs.shuffle(random);
          final escolhidos = allDocs.take(min(3, allDocs.length));

          for (var doc in escolhidos) {
            final data = doc.data() as Map<String, dynamic>;
            miniGames.add(MiniGameTemplate(
              id: doc.id,
              type: MiniGameType.MULTIPLE_LETRAS_LINHA,
              difficulty: 1,
              questao: QuestaoModel.fromMap(data, doc.id),
            ));
          }
        }
        continue;
      }

      // 5) Se tiver 'id' fixo, busca só esse doc
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
        // 6) Senão, carrega toda a coleção de questões
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
  // Utilitários para conversão
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
