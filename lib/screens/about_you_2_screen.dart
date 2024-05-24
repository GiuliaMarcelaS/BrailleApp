import 'package:flutter/material.dart';

class AboutYou2Screen extends StatefulWidget {
  const AboutYou2Screen({super.key});

  @override
  State<AboutYou2Screen> createState() => _AboutYou2ScreenState();
}

class _AboutYou2ScreenState extends State<AboutYou2Screen> {
  void _about_you_3(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-3-screen');
  }

 int selected = 0;

    select(int number){
    setState(() {  
        selected = number;
        print(number);
      
    });}
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE9DD),
        title: Text("Sobre você"),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.black)),
        actions: [Container(
          child: Image.asset('assets/images/muiraq_preto.png'),
          width: screenWidth*20/360,
          margin: EdgeInsets.only(right: screenWidth*25/360),
          )],),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text('No que você tem interesse?'),
            Container(
              width: screenWidth*328/360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: selected==1?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(1);} , 
                child: Row(
                  children: [
                    selected == 1?
                    Icon(Icons.check_box):Icon(Icons.square_outlined),
                    Text('Traduzir caracteres em Braille'),
                  ],
                )
                ),
            ),
            Container(
              width: screenWidth*328/360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: selected==2?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(2);} , 
                child: Row(
                  children: [
                    selected == 2?
                    Icon(Icons.check_box):Icon(Icons.square_outlined),
                    Text('Aprender sobre o Sistema Braille'),
                  ],
                )
                ),
            ),
            Container(
              width: screenWidth*328/360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: selected==3?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(3);} , 
                child: Row(
                  children: [
                    selected == 3?
                    Icon(Icons.check_box):Icon(Icons.square_outlined),
                    Text('Praticar meus conhecimentos'),
                  ],
                )
                ),
            ),
            Container(
                      height: screenHeight*50/800,
                      width: screenWidth*328/360,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF208B52)),
                        onPressed: (){
                          _about_you_3(context);}, 
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