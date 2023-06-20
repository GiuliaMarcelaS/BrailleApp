
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:braille_app/models/fase_list.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:braille_app/screens/auth_or_home_screen.dart';
import 'package:braille_app/screens/fase_screen.dart';
import 'package:braille_app/screens/traducao_screen.dart';
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
          create: (_) => Fase(),
          ),
          ChangeNotifierProvider(
          create: (_) => Ball(pressedBall1: true,pressedBall2: false,pressedBall3: false,pressedBall4: false,pressedBall5: false,pressedBall6: false),
          ),
        ChangeNotifierProvider(
          create: (_) => Passer1(),
          ),
        ChangeNotifierProvider(
          create: (_) => PasserItem(),
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
        routes: {
          '/': (ctx) => const AuthOrHomePage(),
          '/modulos-screen': (ctx) => const ModulosScreen(),
         '/interface-screen':(ctx) => const Interface(),
          '/traducao-screen':(ctx)=> const TraducaoScreen(),
          '/fases-screen':(ctz) => const FaseScreen(),
        },
        ),
    );
  }
}