import 'package:flutter/material.dart';


class AboutYou1Screen extends StatefulWidget {
  const AboutYou1Screen({super.key});

  @override
  State<AboutYou1Screen> createState() => _AboutYou1ScreenState();
}

class _AboutYou1ScreenState extends State<AboutYou1Screen> {
  void _about_you_2(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-2-screen');
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
            Text('O quanto você entende do sistema braille?'),
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
                    Text('Não sei nada'),
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
                    Text('Conheço alguns caracteres'),
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
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    Text('Consigo ler com alguma ajuda'),
                  ],
                )
                ),
            ),
            Container(
              width: screenWidth*328/360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: selected==4?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(4);} , 
                child: Row(
                  children: [
                    selected == 4?
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    Text('Leio sem nenhuma dificuldade'),
                  ],
                )
                ),
            ),
            Container(
                      height: screenHeight*50/800,
                      width: screenWidth*328/360,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF208B52),),
                        onPressed: (){
                          _about_you_2(context);}, 
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