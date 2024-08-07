//import 'dart:js_interop';

import 'package:braille_app/models/information_1.dart';
import 'package:braille_app/models/passer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/fase_grid.dart';


class ModulosScreen extends StatelessWidget with ChangeNotifier{
  num fracao;

  ModulosScreen({super.key,
  this.fracao = 0,
  });

  @override
  Widget build(BuildContext context) {
    final data = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final telasTotal = 8;
    final dados = Provider.of<Information1>(context);
    final fracao = Provider.of<Passer>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      body: Column(
        children: [
          Container(
            height: 160,
            color: Color(0xFF405547),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Image.asset('assets/images/Group40.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text('Olá, ${dados.nome}!',
                      style: TextStyle(color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 10),
                      height: 10,
                      width: 350,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(color: Colors.white,),
                          FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: fracao.fracao/telasTotal,
                            child: Container(color: Colors.green,),
                          )
                        ],
                        ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text('Aulas ${((fracao.fracao/telasTotal)*100).toInt()}% concluídas',
                      style: TextStyle(color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 7),
                      child: Text('Última prática: $data',
                      style: TextStyle(color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),),
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
