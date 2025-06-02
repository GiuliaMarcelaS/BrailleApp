import 'package:braille_app/models/minigame_model.dart';

final Map<String, List<Map<String, dynamic>>> sequenciaMinigames = {
  '1': [
    {
      'categoria': 'apresentar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.APRESENTAR,
      'direct': true, // busca direto do doc “padrao_1”
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'a',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
      // sem 'id': o serviço vai sortear 3 questões desse grupo
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'b',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'c',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'd',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'e',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
  ],
  '2': [
    {
      'categoria': 'apresentar',
      'padrao': 'padrao_2',
      'tipo': MiniGameType.APRESENTAR,
      'direct': true,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_2',
      'grupo': 'a',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_2',
      'grupo': 'b',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_2',
      'grupo': 'c',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
  ],
  '3': [
    {
      'categoria': 'apresentar',
      'padrao': 'padrao_3',
      'tipo': MiniGameType.APRESENTAR,
      'direct': true,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_3',
      'grupo': 'a',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_3',
      'grupo': 'b',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_3',
      'grupo': 'c',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
    },
  ],
  '4': [
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q1',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q2',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q3',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q4',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q5',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q6',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q7',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q8',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q9',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q10',
    },
  ],
};
