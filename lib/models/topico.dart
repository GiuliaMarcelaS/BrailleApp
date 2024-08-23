import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Topico extends StatelessWidget with ChangeNotifier{
  int id;
  String number;
  String title;
  VoidCallback? rota;
  String conteudo;
  List videos;
  List titulos;
  List conteudos;
  List perguntas;
  List respostas;
  List acertos;

   Topico (
    {super.key,
   this.id = 1,
   this. number = '',
   this.title = '',
   this.rota,
   this.conteudo = '',
   this.videos = const [],
   this.titulos = const [],
   this.conteudos = const [],
   this.perguntas = const [],
   this.respostas = const [],
   this.acertos = const [],
   });
    int acertou = 0;
    void qnt_acertos(){
    acertou++;
  }

  @override
  Widget build(BuildContext context) {
    final passer = Provider.of<Passer>(context);
    void _topic1f(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = this;
    final Passer passer = args['passer'];
    Navigator.of(context).pushNamed('/topic-1-screen', arguments: {'fase': fase, 'topico': topico, "passer":passer});
  }
    return Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 20, left: 30),
                  child: Text(
                    number,
                    style: TextStyle(
                      color: Color(0xFF00210E),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: passer.topicoCompleto>=id? IconButton(
                    onPressed: ()=>_topic1f(context),
                    icon: Icon(
                      Icons.play_circle,
                      color: Color(0xFF208B52),
                      size: 30,
                    ),
                  ):IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.lock,
                      color: Color(0xFFACC9B8),
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}