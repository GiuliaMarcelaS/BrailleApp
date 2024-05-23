import 'package:flutter/material.dart';


class AboutYou1Screen extends StatelessWidget {
  const AboutYou1Screen({super.key});
  void _about_you_2(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-2-screen');
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
                    _about_you_2(context);}, 
                  child: Text(
                   'Continuar',
                    style: TextStyle(color: Colors.white),
                  )),
              ),
    );
  }
}