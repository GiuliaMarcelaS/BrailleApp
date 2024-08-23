import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/finished.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcertosScreen extends StatelessWidget {
  const AcertosScreen({super.key});
  void _fase(BuildContext context){
    final fase = Provider.of<Passer>(context, listen: false);
    final Fase faset = ModalRoute.of(context)!.settings.arguments as Fase;
    fase.incrementaFaset(faset);
    Navigator.of(context).popUntil(ModalRoute.withName('/modulos-screen',));
}
void _topicos(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final passer = Provider.of<Passer>(context, listen: false);
    passer.incrementaFaset(fase);
    passer.incrementaTopico(topico);
    passer.salvaTopico(topico, auth.token??'', auth.userId??'');
    final Passer passer2 = args['passer'];
    Navigator.of(context).popUntil(ModalRoute.withName('/fases-screen'));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    return Finished(
      image: 'assets/images/Group48.png',
      negrito: 'Você acertou ${topico.acertou} de ${topico.perguntas.length} perguntas!',
      texto: 'Parabéns!',
      botao: 'Concluir',
      rota: ()=> _topicos(context),
    );
  }
}