import 'package:flutter/material.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

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
              margin: EdgeInsets.only(top:screenHeight*173/800,bottom: screenHeight*14/800),
              width: screenWidth*299/360,
              height: screenHeight*256/800,
              child: Image.asset('assets/images/Layer_2.png'),
            ),
            Container(
              margin: EdgeInsets.only(top:screenHeight*10/800),
              child: Text(
                'Tudo pronto!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700
                ),),
            ),
            Container(
               margin: EdgeInsets.only(top:screenHeight*10/800),
              child: Text(
                'Agora é só começar a explorar!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),),
            ),
             Container(
              margin: EdgeInsets.only(top: screenHeight*100/800),
                      height: screenHeight*50/800,
                      width: screenWidth*328/360,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF208B52),),
                        onPressed: (){}, 
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