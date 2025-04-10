// ignore_for_file: non_constant_identifier_names

import 'package:braille_app/services/auth.dart';
import 'package:braille_app/services/information_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutYou2Screen extends StatefulWidget {
  const AboutYou2Screen({super.key});

  @override
  State<AboutYou2Screen> createState() => _AboutYou2ScreenState();
}

class _AboutYou2ScreenState extends State<AboutYou2Screen> {
  void _about_you_3(BuildContext context) {
    Navigator.of(context).pushNamed('/about-you-3-screen');
  }

  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;

  select1() {
    setState(() {
      selected1 = !selected1;
    });
  }

  select2() {
    setState(() {
      selected2 = !selected2;
    });
  }

  select3() {
    setState(() {
      selected3 = !selected3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final information = Provider.of<Information1>(context);
    final auth = Provider.of<Auth>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE9DD),
        title: Text("Sobre você"),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.black)),
        actions: [
          Container(
            width: screenWidth * 20 / 360,
            margin: EdgeInsets.only(right: screenWidth * 25 / 360),
            child: Image.asset('assets/images/muiraq_preto.png'),
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
                  'No que você tem interesse?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                )),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 20 / 800),
              height: screenHeight * 50 / 800,
              width: screenWidth * 328 / 360,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.black,
                      backgroundColor:
                          selected1 == true ? Color(0xFFBAE2CD) : Colors.white),
                  onPressed: () {
                    select1();
                  },
                  child: Row(
                    children: [
                      selected1 == true
                          ? Icon(Icons.check_box)
                          : Icon(Icons.square_outlined),
                      SizedBox(
                        width: screenWidth * 8 / 360,
                      ),
                      Text('Traduzir caracteres em Braille'),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 20 / 800),
              height: screenHeight * 50 / 800,
              width: screenWidth * 328 / 360,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.black,
                      backgroundColor:
                          selected2 == true ? Color(0xFFBAE2CD) : Colors.white),
                  onPressed: () {
                    select2();
                  },
                  child: Row(
                    children: [
                      selected2 == true
                          ? Icon(Icons.check_box)
                          : Icon(Icons.square_outlined),
                      SizedBox(
                        width: screenWidth * 8 / 360,
                      ),
                      Text('Aprender sobre o Sistema Braille'),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 20 / 800),
              height: screenHeight * 50 / 800,
              width: screenWidth * 328 / 360,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: Colors.black,
                      backgroundColor:
                          selected3 == true ? Color(0xFFBAE2CD) : Colors.white),
                  onPressed: () {
                    select3();
                  },
                  child: Row(
                    children: [
                      selected3 == true
                          ? Icon(Icons.check_box)
                          : Icon(Icons.square_outlined),
                      SizedBox(
                        width: screenWidth * 8 / 360,
                      ),
                      Text('Praticar meus conhecimentos'),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 300 / 800),
              height: screenHeight * 50 / 800,
              width: screenWidth * 328 / 360,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF208B52)),
                  onPressed: () {
                    _about_you_3(context);
                    information.saveInformation2(auth.token ?? '',
                        auth.userId ?? '', selected1, selected2, selected3);
                  },
                  child: Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
