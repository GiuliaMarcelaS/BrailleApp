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
     double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final initialIndex = args?['initialIndex'] ?? 0;

    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  PhraseTranslatorScreen(),
                  ModulosScreen(),
                  LearnScreen(),
                  Container(),
                ],
              ),
            ),
           Container(
              height: 1.0, 
              color: Colors.black, 
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Color(0xFF208B52),
          labelStyle: TextStyle(
            fontSize: 12/800*screenHeight,
          ),
          tabs: [
            Tab(
              icon: Icon(Icons.translate, size: 23/800*screenHeight,),
              text: "Traduzir",
            ),
            Tab(
              icon: Icon(Icons.menu_book_sharp, size: 23/800*screenHeight),
              text: "Aprender",
            ),
            Tab(
              icon: Icon(Icons.auto_fix_high, size: 23/800*screenHeight),
              text: "Praticar",
            ),
            Tab(
              icon: Icon(Icons.person, size: 23/800*screenHeight),
              text: "Perfil",
            ),
          ],
          labelColor: Color(0xFF208B52),
          unselectedLabelColor: Color(0xFF4AB37B),
        ),
      ),
    );
  }
}
