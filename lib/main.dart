
import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:braille_app/models/expressions_list.dart';
import 'package:braille_app/models/fase_list.dart';
import 'package:braille_app/models/graphic.dart';
import 'package:braille_app/models/number_list.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:braille_app/screens/alphabet_translator_screen.dart';
import 'package:braille_app/screens/auth_or_home_screen.dart';
import 'package:braille_app/screens/expressions_translator_screen.dart';
import 'package:braille_app/screens/fase_screen.dart';
import 'package:braille_app/screens/graphic_screen.dart';
import 'package:braille_app/screens/number_translator_screen.dart';
import 'package:braille_app/screens/phrase_translator_screen.dart';
import 'package:braille_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/modulos_screen.dart';
import 'package:braille_app/screens/interface_screen.dart';
import 'package:braille_app/models/fases.dart';

main (){
 runApp(const BrailleApp());
}


class BrailleApp extends StatelessWidget{
  const BrailleApp({super.key});


  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
          ),
          ChangeNotifierProvider(
          create: (_) => FaseList(),
          ),
          ChangeNotifierProvider(
          create: (_) => BallsList(),
          ),
          ChangeNotifierProvider(
          create: (_) => CellsList(),
          ),
          ChangeNotifierProvider(
          create: (_) => AlphabetList(),
          ),
          ChangeNotifierProvider(
          create: (_) => NumberList(),
          ),
          ChangeNotifierProvider(
          create: (_) => ExpressionList(),
          ),
          ChangeNotifierProvider(
          create: (_) => Fase(),
          ),
          ChangeNotifierProvider(
          create: (_) => Ball(),
          ),
        ChangeNotifierProvider(
          create: (_) => Passer1(),
          ),
        ChangeNotifierProvider(
          create: (_) => PasserItem(),
          ),
        ChangeNotifierProvider(
          create: (_) => Graphic(),
          ),
        ChangeNotifierProxyProvider<Auth,Cell>(
          create: (_) => Cell("", ''),
          update:(ctx, auth, previous){
            return Cell(auth.token??'', auth.userId ?? '');
          },),
        ChangeNotifierProxyProvider<Auth,Passer>(
          create: (_) => Passer("", ''),
          update:(ctx, auth, previous){
            return Passer(auth.token??'', auth.userId ?? '');
          },),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => const AuthOrHomePage(),
          '/modulos-screen': (ctx) => const ModulosScreen(),
         '/interface-screen':(ctx) => const Interface(),
         '/tabs-screen':(ctx) => const TabsScreen(),
          '/phrase-translator-screen':(ctx)=> const PhraseTranslatorScreen(),
          '/alphabet-translator-screen':(ctx)=> const AlphabetTranslatorScreen(),
          '/number-translator-screen':(ctx)=> const NumberTranslatorScreen(),
          '/expression-translator-screen':(ctx)=> const ExpressionTranslatorScreen(),
          '/fases-screen':(ctz) => const FaseScreen(),
          '/graphic-screen':(ctz) => GraphicScreen(),
        },
        ),
    );
  }
}