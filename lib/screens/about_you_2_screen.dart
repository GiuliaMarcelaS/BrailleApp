import 'package:flutter/material.dart';

class AboutYou2Screen extends StatelessWidget {
  const AboutYou2Screen({super.key});
  void _about_you_3(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-3-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre você")),
      body:  Container(
                height: screenHeight*50/800,
                width: screenWidth*328/360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFACC9B8)),
                  onPressed: (){
                    _about_you_3(context);}, 
                  child: Text(
                   'Continuar',
                    style: TextStyle(color: Colors.white),
                  )),
              ),
    );
  }
  }