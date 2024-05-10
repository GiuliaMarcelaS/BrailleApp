import 'package:braille_app/components/auth_form.dart';
import 'package:braille_app/components/auth_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFDDE9DD)),
          ),
            SizedBox(
            width: double.infinity,
          //  height: double.infinity,
            child: Column(
              children: [
                 Container(
                  height: screenHeight*0.32,
                  margin: EdgeInsets.only(top:screenHeight*0.32*0.41),
                  child: Image.asset("assets/images/Isolation_Mode.png"),
            ),
                 Container(
                  padding: EdgeInsets.all(1/80*screenHeight),
                  margin: EdgeInsets.only(top:screenHeight*1/80),
                  width: screenWidth*0.79,
                  child: Text(
                    'Vamos começar a decifrar o Braille?',
                    style: TextStyle(
                      fontSize: (26/800)*screenHeight,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(1/80*screenHeight),
                  width: screenWidth*331/360,
                  child: Text(
                    'Desvende o mundo do Braille de forma divertida e interativa com Muiraquitã Braille!',
                    style: TextStyle(
                      fontSize: (14/800)*screenHeight,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SwitchAuth(
                  screenHeight:screenHeight,
                  screenWidth: screenWidth,
                  ),
              ]),
          )
        ],
      ),
    );
  }
}