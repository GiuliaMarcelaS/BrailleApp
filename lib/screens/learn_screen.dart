import 'package:braille_app/data/fases2_data.dart';
import 'package:braille_app/services/auth.dart';
import 'package:braille_app/services/fase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final faseService = FaseService(
      token: auth.token ?? '',
      userId: auth.userId ?? '',
    );

    return FutureBuilder<int>(
      future: faseService.getFaseAtual(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFDDE9DE),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final faseAtual = snapshot.data!;

        return Scaffold(
          backgroundColor: const Color(0xFFDDE9DE),
          appBar: AppBar(
          //  backgroundColor: const Color(0xFF8FBF8F),
            elevation: 0,
            title: const Text(
              'Vamos aprender?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: GridView.builder(
              itemCount: fases.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) {
                final fase = fases[index];
                final idNum = int.tryParse(fase.id) ?? 0;
                final isUnlocked = idNum <= faseAtual;

                return Opacity(
                  opacity: isUnlocked ? 1.0 : 0.35,
                  child: InkWell(
                    onTap: isUnlocked
                        ? () => Navigator.pushNamed(
                              context,
                              '/fase-screen',
                              arguments: fase,
                            )
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: fase.color,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fase.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Text(
                                  //   fase.description,
                                  //   style: TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.grey[600],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
