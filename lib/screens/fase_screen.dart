import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:braille_app/models/topico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class FaseScreen extends StatelessWidget {
  const FaseScreen({super.key});

  void _topic1f(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    Navigator.of(context).pushNamed('/topic-1-screen', arguments: {'fase': fase,"topico": topico});
  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        title: Text(args['fase'].title),
        backgroundColor: Color(0xFFF1FEF1),
        centerTitle: true,
        actions: [
          Container(
            child: Image.asset('assets/images/muiraq_preto.png'),
            width: screenWidth * 20 / 360,
            margin: EdgeInsets.only(right: screenWidth * 25 / 360),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Container(
              color: Color(0xFFF1FEF1),
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset('assets/images/modulo1.png'),
                    margin: EdgeInsets.only(right: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Introdução ao Braille",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: screenWidth - 200,
                        child: Text(
                          'Este módulo tem como objetivo proporcionar uma compreensão abrangente do sistema Braille e destacar sua relevância crucial na educação de pessoas com deficiência visual',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 30),
                        child: Text(
                          '25% concluído',
                          style: TextStyle(
                            color: Color(0xFF208B52),
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 10,
          ),
          Topico(id: 1, number: '01', title: 'História e Origens do Braille', rota:()=>_topic1f(context),),
          Topico(id: 2, number: '02', title: 'Significado e Impacto Social do Sistema Braille', rota: (){},),
          Topico(id: 3, number: '03', title: 'Evolução do Sistema Braille', rota: (){},),
          Topico(id: 4, number: '04', title: 'Desafios e Oportunidades na Aprendizagem do Braille', rota: (){},),
        ],
      ),
    );
  }
}