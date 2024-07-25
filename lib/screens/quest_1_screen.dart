import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/topico.dart';
import 'package:braille_app/screens/modulos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quest1Screen extends StatefulWidget {
  const Quest1Screen({super.key});

  @override
  State<Quest1Screen> createState() => _Quest1ScreenState();
}

class _Quest1ScreenState extends State<Quest1Screen> {
  void _acertos(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fase fase = args['fase'];
    final Topico topico = args['topico'];
    final Passer passer = args['passer'];
    passer.incrementaFracao(passer);
    Navigator.of(context).pushNamed('/acertos-screen', arguments: {'fase': fase,"topico": topico,"passer":passer});
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
        title: Text("Questionário"),
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
            Container(
              margin: EdgeInsets.only(top:screenHeight*30/800),
              child: Text(
                'Como o Braille contribui para a autonomia de indivíduos com deficiência visual?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*20/800),
              height: screenHeight*50/800,
              width: screenWidth*328/360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: selected==1?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(1);} , 
                child: Row(
                  children: [
                    selected == 1?
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    SizedBox(width: screenWidth*8/360,),
                    Text('Limitando suas habilidades'),
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*15/800),
              width: screenWidth*328/360,
              height: screenHeight*50/800,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: selected==2?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(2);} , 
                child: Row(
                  children: [
                    selected == 2?
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    SizedBox(width: screenWidth*8/360,),
                    Text('Facilitando o acesso independente à informação'),
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*15/800),
              width: screenWidth*328/360,
              height: screenHeight*50/800,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: selected==3?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(3);} , 
                child: Row(
                  children: [
                    selected == 3?
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    SizedBox(width: screenWidth*8/360,),
                    Text('Tornando-os dependentes de uma ajuda externa'),
                  ],
                )
                ),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*15/800),
              width: screenWidth*328/360,
              height: screenHeight*50/800,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: selected==4?Color(0xFFBAE2CD):Colors.white),
                onPressed:(){select(4);} , 
                child: Row(
                  children: [
                    selected == 4?
                    Icon(Icons.check_circle_outline_outlined):Icon(Icons.circle_outlined),
                    SizedBox(width: screenWidth*8/360,),
                    Text('Não tem impacto na autonomia'),
                  ],
                )
                ),
            ),
            Container(
                      margin: EdgeInsets.only(top:screenHeight*250/800),
                      height: screenHeight*50/800,
                      width: screenWidth*328/360,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF208B52),),
                        onPressed: (){
                          _acertos(context); }, 
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