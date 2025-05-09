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
    ],
  ),
  Fase(
    id: '2',
    title: 'Mestre das Sílabas',
    description: 'Forme palavras em Braille',
    color: Color(0xFF6FCF97),
    icon: 'assets/mestre.png',
    miniGames: [
    ],
  ),
];
