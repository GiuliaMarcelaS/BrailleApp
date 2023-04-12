import 'package:braille_app/fase1/f1.dart';
import 'package:braille_app/fase1/fase1.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/models/fase_list.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer2.dart';
import 'package:braille_app/screens/auth_or_home_screen.dart';
import 'package:braille_app/screens/auth_screen.dart';
import 'package:braille_app/screens/fase_screen.dart';
import 'package:braille_app/screens/traducao_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import './screens/modulos_screen.dart';
import 'screens/modulos_screen.dart';
import 'package:braille_app/screens/interface_screen.dart';
import 'package:braille_app/screens/auth_screen.dart';
import 'package:braille_app/models/fases.dart';

main (){
 runApp(BrailleApp());
}


class BrailleApp extends StatelessWidget{

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
          create: (_) => Fase(),
          ),
        ChangeNotifierProxyProvider<Auth,Cell>(
          create: (_) => Cell("", ''),
          update:(ctx, auth, previous){
            return Cell(auth.token??'', auth.userId ?? '');
          },),
        ChangeNotifierProxyProvider<Auth,Passer2>(
          create: (_) => Passer2("", ''),
          update:(ctx, auth, previous){
            return Passer2(auth.token??'', auth.userId ?? '');
          },
  
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => AuthOrHomePage(),
          '/modulos-screen': (ctx) => ModulosScreen(),
         '/interface-screen':(ctx) => Interface(),
          '/traducao-screen':(ctx)=> TraducaoScreen(),
          '/F1-screen':(ctz) => F1(),
          '/Fase1-screen':(ctz) => Fase1(),
          '/fases-screen':(ctz) => FaseScreen(),
        },
        ),
    );
  }
}