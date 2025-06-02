import 'package:braille_app/components/auth_switch.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFDDE9DD)),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.32 * 0.5),
                  Container(
                    height: screenHeight * 0.4,
                    child: Image.asset("assets/images/interface_braille.png"),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 40 / 800),
                child: SwitchAuth(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
