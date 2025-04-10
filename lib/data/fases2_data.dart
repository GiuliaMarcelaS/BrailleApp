 import 'dart:ui';
import 'package:braille_app/components/fase.dart';
 
 final List<Fase> fases = [
    Fase(
      title: 'Explorador Braille',
      description:
          'Treine o reconhecimento das letras em Braille correspondentes ao alfabeto tradicional',
      color: Color(0xFF00C2CB),
      icon: 'assets/explorador.png',
    ),
    Fase(
      title: 'Mestre das Sílabas',
      description:
          'Eleve o desafio ao formar palavras em Braille, construindo vocabulário com sílabas comuns',
      color: Color(0xFF6FCF97),
      icon: 'assets/mestre.png',
    ),
    Fase(
      title: 'Herói da Leitura Tátil',
      description:
          'Transcreva passagens de textos e aprimore suas habilidades na escrita tátil',
      color: Color(0xFFBB6BD9),
      icon: 'assets/heroi.png',
    ),
  ];