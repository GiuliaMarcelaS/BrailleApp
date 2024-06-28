import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class FaseScreen extends StatelessWidget {
  const FaseScreen({super.key});

  void _topic1(BuildContext context) {
    Navigator.of(context).pushNamed('/topic-1-screen');
  }

  @override
  Widget build(BuildContext context) {
    final passer = Provider.of<Passer>(context);
    final auth = Provider.of<Auth>(context, listen: false);
    final fase = Provider.of<Fase>(context);
    final Fase faset = ModalRoute.of(context)!.settings.arguments as Fase;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        title: Text(faset.title),
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
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 20, left: 30),
                  child: Text(
                    '01',
                    style: TextStyle(
                      color: Color(0xFF00210E),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'História e Origens do Braille',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () => _topic1(context),
                    icon: Icon(
                      Icons.play_circle,
                      color: Color(0xFF208B52),
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 20, left: 30),
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Color(0xFF00210E).withOpacity(0.5), 
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Significado e Impacto Social do Sistema Braille',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5), 
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFACC9B8), 
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white, 
                        size: 20,
                      ),
                    ),
                    iconSize: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 20, left: 30),
                  child: Text(
                    '03',
                    style: TextStyle(
                      color: Color(0xFF00210E).withOpacity(0.5), 
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Evolução do Sistema Braille',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5), 
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFACC9B8), 
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white, 
                        size: 20,
                      ),
                    ),
                    iconSize: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 20, left: 30),
                  child: Text(
                    '04',
                    style: TextStyle(
                      color: Color(0xFF00210E).withOpacity(0.5), 
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Desafios e Oportunidades na Aprendizagem do Braille',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFACC9B8), 
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    iconSize: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}