import 'package:braille_app/components/fase.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE9DE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Giulia',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Como você quer praticar hoje?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: fases.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final fase = fases[index];
                    return _buildOptionCard(fase, () {
                      Navigator.pushNamed(
                        context,
                        '/fase-screen',
                        arguments: fase,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(Fase fase, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fase.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      fase.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: fase.color,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Image.asset(
                  fase.icon,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
