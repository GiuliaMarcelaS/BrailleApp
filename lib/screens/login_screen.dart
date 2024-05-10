import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
              Container(
                width: screenWidth*328/360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){}, 
                  child: Text(
                    'Continue com Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                  )),
              ),
              SizedBox(height: screenHeight*1/40,),
              Container(
                width: screenWidth*328/360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){}, 
                  child: Text(
                    'Continue com Facebook',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                  )),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight*30/800),
                height: 0.5,
                width: screenWidth*300/360, 
                color: Colors.black,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Primeira vez por aqui?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),),
                      TextButton(
                        onPressed: (){}, 
                        child: Text(
                          true ? 'Crie uma conta': 'JÁ POSSUI CONTA?',
                          style: TextStyle(color: Color(0xFF1CB9C5)),
                        )),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}