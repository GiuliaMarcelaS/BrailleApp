import 'package:braille_app/components/fase.dart';
import 'package:braille_app/data/fases2_data.dart';
import 'package:braille_app/services/auth.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final faseService = FaseService(
      token: auth.token ?? '',
      userId: auth.userId ?? '',
    );

    return FutureBuilder<int>(
      future: faseService.getFaseAtual(),
      builder: (context, snapshotFaseAtual) {
        if (!snapshotFaseAtual.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final faseAtual = snapshotFaseAtual.data!;
        final fasesDisponiveis = fases;

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
                      itemCount: fasesDisponiveis.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final fase = fasesDisponiveis[index];
                        final isDesbloqueada =
                            int.tryParse(fase.id) != null &&
                            int.parse(fase.id) <= faseAtual;

                        return Opacity(
                          opacity: isDesbloqueada ? 1.0 : 0.5,
                          child: _buildOptionCard(
                            fase,
                            isDesbloqueada
                                ? () {
                                    Navigator.pushNamed(
                                      context,
                                      '/fase-screen',
                                      arguments: fase,
                                    );
                                  }
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionCard(Fase fase, VoidCallback? onTap) {
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