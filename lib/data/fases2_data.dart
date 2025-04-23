import 'package:braille_app/components/fase.dart';
import 'package:flutter/material.dart';
import '../models/minigame_model.dart';

final List<Fase> fases = [
  Fase(
    id: '1',
    title: 'Explorador Braille',
    description: 'Treine o reconhecimento das letras em Braille',
    color: Color(0xFF00C2CB),
    icon: 'assets/explorador.png',
    miniGames: [
      MiniGameTemplate(
        id: '1-1',
        type: MiniGameType.LETTER_RECOGNITION,
        difficulty: 1,
        content: {'letter': 'A', 'brailleSymbol': '⠁'},
      ),
      MiniGameTemplate(
        id: '1-2',
        type: MiniGameType.LETTER_RECOGNITION,
        difficulty: 1,
        content: {'letter': 'B', 'brailleSymbol': '⠃'},
      ),
    ],
  ),
  Fase(
    id: '2',
    title: 'Mestre das Sílabas',
    description: 'Forme palavras em Braille',
    color: Color(0xFF6FCF97),
    icon: 'assets/mestre.png',
    miniGames: [
      MiniGameTemplate(
        id: '2-1',
        type: MiniGameType.SYLLABLE,
        difficulty: 1,
        content: {
          'syllable': 'BA',
          'brailleSymbols': ['⠃', '⠁']
        },
      ),
    ],
  ),
];
