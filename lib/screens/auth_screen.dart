import 'package:braille_app/components/auth_form.dart';
import 'package:braille_app/components/auth_switch.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xFFDDE9DD)),
          ),
            SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                 SizedBox(
            width: 250,
            child: Image.asset("assets/images/Isolation_Mode.png"),
            ),
                const SizedBox(
                  width: 276,
                  child: Text(
                    'Vamos começar a decifrar o Braille?',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Desvende o mundo do Braille de forma divertida e interativa com Muiraquitã Braille!',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SwitchAuth(),
              ]),
          )
        ],
      ),
    );
  }
}