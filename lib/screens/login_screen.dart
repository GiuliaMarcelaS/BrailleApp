import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/group12.png'),
          ),
          AuthForm(),
        ],
      ),
    );
  }
}