import 'package:braille_app/models/graphic.dart';
import 'package:braille_app/models/teste.dart';
import 'package:braille_app/screens/alphabet_translator_screen.dart';
import 'package:braille_app/screens/expressions_translator_screen.dart';
import 'package:braille_app/screens/number_translator_screen.dart';
import 'package:braille_app/screens/phrase_translator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});
  void _graphic(BuildContext context){
    Navigator.of(context).pushNamed('/graphic-screen');
   }

  @override
  Widget build(BuildContext context) {
    final graphic = Provider.of<Graphic>(context);
    final teste = Provider.of<Teste>(context);
    final auth = Provider.of<Auth>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("tradução"),
          actions: [
            IconButton(onPressed: () {
              teste.teste(auth.token??'', auth.userId??'');
              _graphic(context);
              },
              icon: const Icon(Icons.bar_chart))
          ],
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