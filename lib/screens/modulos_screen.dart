//import 'dart:js_interop';

import 'package:braille_app/models/information_1.dart';
import 'package:braille_app/models/passer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/fase_grid.dart';

class ModulosScreen extends StatelessWidget with ChangeNotifier {
  num fracao;

  ModulosScreen({
    super.key,
    this.fracao = 0,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final totalVideos = args['totalVideos'] ?? 0;
    final totalPerguntas = args['totalPerguntas'] ?? 0;
    final data = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final telasTotal = totalVideos + totalPerguntas;
    final dados = Provider.of<Information1>(context);
    final fracao = Provider.of<Passer>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      body: Column(
        children: [
          Container(
            height: 195 / 800 * screenHeight,
            color: Color(0xFF405547),
            child: Row(
              children: [
                Container(
                  height: 90 / 800 * screenHeight,
                  margin: EdgeInsets.only(left: 20),
                  child: Image.asset('assets/images/Group40.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 82 / 800 * screenHeight),
                      child: Text(
                        'Olá, ${dados.nome}!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18 / 800 * screenHeight,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 12 / 800 * screenHeight),
                      height: 10,
                      width: 212 / 360 * screenWidth,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.white,
                          ),
                          FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: fracao.fracao / telasTotal,
                            child: Container(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 3 / 800 * screenHeight),
                      child: Text(
                        'Aulas ${((fracao.fracao / telasTotal) * 100).toInt()}% concluídas',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12 / 800 * screenHeight,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 2 / 800 * screenHeight),
                      child: Text(
                        'Última prática: $data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12 / 800 * screenHeight,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: FaseGrid()),
        ],
      ),
    );
  }
}
