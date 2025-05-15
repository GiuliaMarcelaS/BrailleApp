import 'package:braille_app/models/minigame_model.dart';

final Map<String, List<Map<String, dynamic>>> sequenciaMinigames = {
  '1': [
    {
      'categoria': 'apresentar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.APRESENTAR,
      'id': 'q1', // ID da questão específica
    },
    {
      'categoria': 'reconhecer',
      'padrao': 'padrao_1',
      'grupo': 'a',
      'tipo': MiniGameType.MULTIPLE_LETRAS_LINHA,
      'id': 'q1',
    },
    {
      'categoria': 'diferenciar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.COMPLETAR_PALAVRA,
      'id': 'q1',
    },
  ],
  '2': [
    {
      'categoria': 'apresentar',
      'padrao': 'padrao_1',
      'tipo': MiniGameType.APRESENTAR,
      'id': 'q2'
    },
  ],
};