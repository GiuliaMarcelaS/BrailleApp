import 'package:flutter/material.dart';

class AboutYou3Screen extends StatefulWidget {
  const AboutYou3Screen({super.key});

  @override
  State<AboutYou3Screen> createState() => _AboutYou3ScreenState();
}

class _AboutYou3ScreenState extends State<AboutYou3Screen> {
  void _ready(BuildContext context){
    Navigator.of(context).pushNamed('/ready-screen');
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
          )], ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          children: [
             Text('Podemos te ajudar a lembrar de praticar?'),
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
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    Text('Sim, por favor!'),
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
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    Text('Agora não'),
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
                          _ready(context);}, 
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