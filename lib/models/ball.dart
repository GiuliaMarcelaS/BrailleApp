import 'package:flutter/material.dart';

class Ball with ChangeNotifier{
  int id;
  bool pressedBall1;
  bool pressedBall2;
  bool pressedBall3;
  bool pressedBall4;
  bool pressedBall5;
  bool pressedBall6;
  bool pressedBall11;
  bool pressedBall22;
  bool pressedBall33;
  bool pressedBall44;
  bool pressedBall55;
  bool pressedBall66;
  String translation;

  Ball({
    this.id = 0,
    this.pressedBall1 = false,
    this.pressedBall2 = false,
    this.pressedBall3 = false,
    this.pressedBall4 = false,
    this.pressedBall5 = false,
    this.pressedBall6 = false,
    this.pressedBall11 = false,
    this.pressedBall22 = false,
    this.pressedBall33 = false,
    this.pressedBall44 = false,
    this.pressedBall55 = false,
    this.pressedBall66 = false,
    this.translation = "",
  });
   
    void pressBall(){
      if (id==1){
        pressedBall1=!pressedBall1;
      }
      if (id==2){
        pressedBall2=!pressedBall2;
      }
      if (id==3){
        pressedBall3=!pressedBall3;
      }
      if (id==4){
        pressedBall4=!pressedBall4;
      }
      if (id==5){
        pressedBall5=!pressedBall5;
      }
      if (id==6){
        pressedBall6=!pressedBall6;
      }
      
   }

  //  phraseLenght(String letra){
  //    int length = letra.length;
  //    notifyListeners();
  //  }

   List duasMatrizes = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
   List balls1 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   List balls2 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   List balls3 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   List balls4 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   List balls5 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   List balls6 = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
    translate(String letra, int id){
      for(int i = 0; i<letra.length;i++){
        balls1[i] = false;
        balls2[i] = false;
        balls3[i] = false;
        balls4[i] = false;
        balls5[i] = false;
        balls6[i] = false;
      if (letra[i] =='a'){
      balls1[i]=!balls1[i];
      }
    else if (letra[i]=="b"){
      balls1[i]=!balls1[i];
      balls3[i]=!balls3[i];
    }
    else if (letra[i]=="A"){
      balls2[i]=!balls2[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="c"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
    }
    else if (letra[i]=="d"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls4[i]=!balls4[i];
    }
    else if (letra[i]=="e"){
      balls1[i]=!balls1[i];
      balls4[i]=!balls4[i];
    }
    else if (letra[i]=="f"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
    }
    else if (letra[i]=="g"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
    }
    else if (letra[i]=="h"){
      balls1[i]=!balls1[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
    }
    else if (letra[i]=="i"){
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
    }
    else if (letra[i]=="j"){
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
    }
    else if (letra[i]=="k"){
      balls1[i]=!balls1[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="l"){
      balls1[i]=!balls1[i];
      balls3[i]=!balls3[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="m"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="n"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="o"){
      balls1[i]=!balls1[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="p"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="q"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="r"){
      balls1[i]=!balls1[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="s"){
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="t"){
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
    }
    else if (letra[i]=="u"){
      balls1[i]=!balls1[i];
      balls5[i]=!balls5[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="v"){
      balls1[i]=!balls1[i];
      balls3[i]=!balls3[i];
      balls5[i]=!balls5[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="w"){
      balls2[i]=!balls2[i];
      balls3[i]=!balls3[i];
      balls4[i]=!balls4[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="x"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls5[i]=!balls5[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="y"){
      balls1[i]=!balls1[i];
      balls2[i]=!balls2[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
      balls6[i]=!balls6[i];
    }
    else if (letra[i]=="z"){
      balls1[i]=!balls1[i];
      balls4[i]=!balls4[i];
      balls5[i]=!balls5[i];
      balls6[i]=!balls6[i];
    }
      }
    notifyListeners();
   }

   reset(String letra){
    pressedBall1 = false;
    pressedBall2 = false;
    pressedBall3 = false;
    pressedBall4 = false;
    pressedBall5 = false;
    pressedBall6 = false;
   }

   void cells (String letra){
    List matrix;
    if (letra =='a'){
      matrix = [true,false,false,false,false,false];
      }
    else if (letra=="b"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
    }
    else if (letra=="c"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
    }
    else if (letra=="d"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
    }
    else if (letra=="e"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
    }
    else if (letra=="f"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
    }
    else if (letra=="g"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra=="h"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra=="i"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
    }
    else if (letra=="j"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra=="k"){
      pressedBall1=!pressedBall1;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="l"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="m"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="n"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="o"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="p"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="q"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="r"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="s"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="t"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra=="u"){
      pressedBall1=!pressedBall1;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra=="v"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra=="w"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall6=!pressedBall6;
    }
    else if (letra=="x"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra=="y"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra=="z"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    notifyListeners();
   }



}