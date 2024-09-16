import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quest1Screen extends StatefulWidget {
  const Quest1Screen({super.key});

  @override
  State<Quest1Screen> createState() => _Quest1ScreenState();
}

class _Quest1ScreenState extends State<Quest1Screen> {
  int indice = 0;
  int selected = 0;
  bool isAnswered = false;
  bool isCorrect = false;
  bool showContinueButton = false;

  void _acertos(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    final auth = Provider.of<Auth>(context, listen: false);
    if (passer.topicoCompleto <= topico.id) {
      passer.incrementaFracao(
          passer, topico, fase, auth.token ?? '', auth.userId ?? "");
    }
    passer.salvaAcerto(
        fase, topico, auth.token ?? '', auth.userId ?? "", topico.acertou);
    Navigator.of(context).pushNamed('/acertos-screen',
        arguments: {'fase': fase, "topico": topico, "passer": passer});
  }

  void select(int number, Topico topico) {
    setState(() {
      selected = number;
    });
  }

  void analiseAcerto(int number, Topico topico) {
    setState(() {
      isAnswered = true;
      isCorrect = topico.acertos[indice] == (number - 1);
      showContinueButton = true;
      if (isCorrect) {
        topico.qnt_acertos();
      }
    });
  }

  int incrementaLista() {
    setState(() {
      indice++;
      isAnswered = false;
      selected = 0;
      showContinueButton = false;
    });
    return indice;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE9DD),
        title: Text("Questionário"),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.black)),
        actions: [
          Container(
            child: Image.asset('assets/images/muiraq_preto.png'),
            width: screenWidth * 20 / 360,
            margin: EdgeInsets.only(right: screenWidth * 25 / 360),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: screenHeight * 30 / 800),
              child: Text(
                topico.perguntas[indice],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            for (int i = 1; i <= 4; i++)
              Container(
                margin: EdgeInsets.only(top: screenHeight * 15 / 800),
                width: screenWidth * 328 / 360,
                height: screenHeight * 50 / 800,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.black,
                    backgroundColor:
                        selected == i ? Color(0xFFBAE2CD) : Colors.white,
                  ),
                  onPressed: isAnswered ? null : () => select(i, topico),
                  child: Row(
                    children: [
                      if (selected == i && isAnswered)
                        isCorrect
                            ? Icon(Icons.check_circle_outline_outlined)
                            : Icon(Icons.close),
                      if (selected != i) Icon(Icons.circle_outlined),
                      SizedBox(width: screenWidth * 8 / 360),
                      Text(topico.respostas[indice][i - 1]),
                    ],
                  ),
                ),
              ),
            if (!isAnswered)
              Container(
                margin: EdgeInsets.only(top: screenHeight * 15 / 800),
                height: screenHeight * 50 / 800,
                width: screenWidth * 328 / 360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF208B52),
                  ),
                  onPressed: selected != 0
                      ? () => analiseAcerto(selected, topico)
                      : null,
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            if (showContinueButton)
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 15 / 800),
                    child: Text(
                      isCorrect ? 'Resposta correta!' : 'Resposta incorreta!',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isCorrect ? Colors.green : Colors.red),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 15 / 800),
                    height: screenHeight * 50 / 800,
                    width: screenWidth * 328 / 360,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF208B52),
                      ),
                      onPressed: () {
                        if (indice + 1 == topico.perguntas.length) {
                          _acertos(context);
                        } else {
                          incrementaLista();
                        }
                      },
                      child: Text(
                        'Continuar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}