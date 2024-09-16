import 'package:braille_app/models/graphic.dart';
import 'package:braille_app/models/teste.dart';
import 'package:braille_app/screens/alphabet_translator_screen.dart';
import 'package:braille_app/screens/expressions_translator_screen.dart';
import 'package:braille_app/screens/learn_screen.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:braille_app/screens/number_translator_screen.dart';
import 'package:braille_app/screens/phrase_translator_screen.dart';
import 'package:braille_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class TabsScreen2 extends StatelessWidget {
  const TabsScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera os argumentos da navegação
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final initialIndex = args?['initialIndex'] ?? 0;

    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  TabsScreen(),
                  ModulosScreen(),
                  LearnScreen(),
                  Container(), // Perfil ou outro conteúdo
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.translate),
              text: "Traduzir",
            ),
            Tab(
              icon: Icon(Icons.menu_book_sharp),
              text: "Aprender",
            ),
            Tab(
              icon: Icon(Icons.auto_fix_high),
              text: "Praticar",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Perfil",
            ),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }
}
