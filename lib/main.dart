import 'package:braille_app/fase1/f1.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:braille_app/screens/auth_or_home_screen.dart';
import 'package:braille_app/screens/auth_screen.dart';
import 'package:braille_app/screens/traducao_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import './screens/modulos_screen.dart';
import 'screens/modulos_screen.dart';
import 'package:braille_app/screens/interface_screen.dart';
import 'package:braille_app/screens/auth_screen.dart';

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
        ChangeNotifierProxyProvider<Auth,Cell>(
          create: (_) => Cell("", ''),
          update:(ctx, auth, previous){
            return Cell(auth.token??'', auth.userId ?? '');
          },
  
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => AuthOrHomePage(),
          '/modulos-screen': (ctx) => ModulosScreen(),
         '/interface-screen':(ctx) => Interface(),
          '/traducao-screen':(ctx)=> TraducaoScreen(),
          '/fase1-screen':(ctz) => F1(),
        },
        ),
    );
  }
}