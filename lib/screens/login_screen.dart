import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE9DD),
        title: Text('Login'), 
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.black)),
        ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:screenHeight*36/800),
            child: Image.asset('assets/images/group12.png'),
          ),
          AuthForm(),
        ],
      ),
    );
  }
}