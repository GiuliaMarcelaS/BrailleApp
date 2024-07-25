import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Topic1Screen extends StatelessWidget {
  const Topic1Screen({super.key});

  void _topico1conteudo(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    passer.incrementaFracao(passer);
    Navigator.of(context).pushNamed('/topico-1-conteudo-screen', arguments: {'fase': fase,"topico": topico, "passer":passer});
  }



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1FEF1),
        title: Text("Tópico 1"),
        centerTitle: true,
        actions: [Container(
          child: Image.asset('assets/images/muiraq_preto.png'),
          width: screenWidth*20/360,
          margin: EdgeInsets.only(right: screenWidth*25/360),
          )],),
          body:  Column(
            children: [
              Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Container(
              color: Color(0xFFF1FEF1),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('assets/images/Group143.png'),
                    margin: EdgeInsets.only(right: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        width: 200,
                        child: Text(
                          "Significado e Impacto Social do Sistema Braille",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                        width: 380,
                        child: Text('Neste tópico, exploraremos a significância do Braille na vida das pessoas com deficiência visual. Ao concluir este tópico, você terá uma compreensão aprofundada do impacto social do Braille, compreendendo como esse sistema tátil promove independência e participação plena na sociedade para pessoas com deficiência visual.'),
                      ),
                  Container(
                              margin: EdgeInsets.only(top:screenHeight*150/800),
                              height: screenHeight*50/800,
                              width: screenWidth*328/360,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF208B52),),
                                onPressed: (){
                                  _topico1conteudo(context);}, 
                                child: Text(
                                 'Continuar',
                                  style: TextStyle(color: Colors.white),
                                )),
                            ),
                ],
              ),
            ],
          ),
    );
  }
}