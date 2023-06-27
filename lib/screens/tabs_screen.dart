import 'package:braille_app/screens/alphabet_translator_screen.dart';
import 'package:braille_app/screens/expressions_translator_screen.dart';
import 'package:braille_app/screens/number_translator_screen.dart';
import 'package:braille_app/screens/phrase_translator_screen.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("tradução"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "ALFABETO",
              ),
              Tab(
                text: "PALAVRAS",
              ),
              Tab(
                text: "NÚMEROS",
              ),
              Tab(
                text: "EXPRESSÕES",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AlphabetTranslatorScreen(),
            PhraseTranslatorScreen(),
            NumberTranslatorScreen(),
            ExpressionTranslatorScreen(),
          ],
        ),
      ),
    );
  }
}