import 'package:flutter/material.dart';

class Finished extends StatelessWidget {
  String image;
  String negrito;
  String texto;
  String botao;
  VoidCallback? rota;
  
  Finished({super.key,
  this.image = '',
  this.negrito = '',
  this.texto = '',
  this.botao = '',
  this.rota
  });

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
              child: Image.asset(image),
              height: screenHeight*298/800,
              margin: EdgeInsets.only(top:screenHeight*125/800, bottom: screenHeight*20/800),
              ),
            Container(
              width: screenWidth*276/360,
              margin: EdgeInsets.only(bottom:screenHeight*10/800),
              child: Text(
                negrito,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,),
            ),
            Container(
              width: screenWidth*276/360,
              child: Text(
                texto,
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
                    onPressed: rota, 
                    child: Text(
                     botao,
                      style: TextStyle(color: Colors.white),
                    )),
                ),
          ],
        ),
      ),
    );
  }
}