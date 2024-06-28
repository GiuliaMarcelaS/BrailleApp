import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/fase_grid.dart';


class ModulosScreen extends StatelessWidget {
  const ModulosScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Text('Olá, Giulia Marcela!',
                      style: TextStyle(color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 10),
                      height: 10,
                      width: 350,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text('Aulas 10% concluídas',
                      style: TextStyle(color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,top: 7),
                      child: Text('Última prática: 12/03/24',
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
