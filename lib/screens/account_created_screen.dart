import 'package:flutter/material.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  void _about_you_1(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-1-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Text('Estamos felizes por você estar aqui'),
          Container(
                height: screenHeight*50/800,
                width: screenWidth*328/360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFACC9B8)),
                  onPressed: (){
                    _about_you_1(context);}, 
                  child: Text(
                   'Continuar',
                    style: TextStyle(color: Colors.white),
                  )),
              ),
        ],
      ),
    );
  }
}