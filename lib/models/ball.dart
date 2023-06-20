import 'package:flutter/material.dart';

class Ball with ChangeNotifier{
  int id;
  bool pressedBall1;
  bool pressedBall2;
  bool pressedBall3;
  bool pressedBall4;
  bool pressedBall5;
  bool pressedBall6;
  String translation;

  Ball({
    this.id = 0,
    this.pressedBall1 = false,
    this.pressedBall2 = false,
    this.pressedBall3 = false,
    this.pressedBall4 = false,
    this.pressedBall5 = false,
    this.pressedBall6 = false,
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

    translate(String letra){
      for(int i = 0; i<letra.length;i++){
      // pressedBall1=false;
      // pressedBall2=false;
      // pressedBall3=false;
      // pressedBall4=false;
      // pressedBall5=false;
      // pressedBall6=false;
      if (letra[i] =='a'){
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
      }
    else if (letra[i]=="b"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
    }
    else if (letra[i]=="c"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
    }
    else if (letra[i]=="d"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
    }
    else if (letra[i]=="e"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
    }
    else if (letra[i]=="f"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
    }
    else if (letra[i]=="g"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra[i]=="h"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra[i]=="i"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
    }
    else if (letra[i]=="j"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
    }
    else if (letra[i]=="k"){
      pressedBall1=!pressedBall1;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="l"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="m"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="n"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="o"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="p"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="q"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="r"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="s"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="t"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
    }
    else if (letra[i]=="u"){
      pressedBall1=!pressedBall1;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra[i]=="v"){
      pressedBall1=!pressedBall1;
      pressedBall3=!pressedBall3;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra[i]=="w"){
      pressedBall2=!pressedBall2;
      pressedBall3=!pressedBall3;
      pressedBall4=!pressedBall4;
      pressedBall6=!pressedBall6;
    }
    else if (letra[i]=="x"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra[i]=="y"){
      pressedBall1=!pressedBall1;
      pressedBall2=!pressedBall2;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
    }
    else if (letra[i]=="z"){
      pressedBall1=!pressedBall1;
      pressedBall4=!pressedBall4;
      pressedBall5=!pressedBall5;
      pressedBall6=!pressedBall6;
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

}