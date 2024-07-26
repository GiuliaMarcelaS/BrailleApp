import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/finished.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestarScreen extends StatelessWidget {
  const TestarScreen({super.key});

  void _quest_1(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    if(passer.topicoCompleto<=topico.id)
    {passer.incrementaFracao(passer);}
    Navigator.of(context).pushNamed('/quest-1-screen', arguments: {'fase': fase,"topico": topico,'passer':passer});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Finished(
      image: 'assets/images/Group46.png',
      negrito: 'Agora vamos testar seus conhecimentos!',
      texto: 'Pronto para o questionário final?',
      botao: 'Continuar',
      rota: ()=>_quest_1(context),
    );
  }
}