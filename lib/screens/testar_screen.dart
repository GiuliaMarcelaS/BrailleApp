import 'package:flutter/material.dart';

class TestarScreen extends StatelessWidget {
  const TestarScreen({super.key});

  void _quest_1(BuildContext context){
    Navigator.of(context).pushNamed('/quest-1-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFDDE9DD),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/Layer_1.png'),
              height: screenHeight*298/800,
              margin: EdgeInsets.only(top:screenHeight*125/800, bottom: screenHeight*20/800),
              ),
            Container(
              width: screenWidth*276/360,
              margin: EdgeInsets.only(bottom:screenHeight*10/800),
              child: Text(
                'Estamos felizes por você estar aqui!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,),
            ),
            Container(
              width: screenWidth*276/360,
              child: Text(
                'Seu perfil foi criado com sucesso.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight*110/800),
                  height: screenHeight*50/800,
                  width: screenWidth*328/360,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF208B52)),
                    onPressed: (){
                      _quest_1(context);}, 
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