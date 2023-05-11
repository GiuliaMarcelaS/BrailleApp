import 'dart:convert';

import 'package:braille_app/components/translation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:braille_app/utils/constants.dart';

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

   List duasMatrizes = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
    
    translate(String letra){
   if(duasMatrizes.contains(letra)){
     if (letra=="0"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="1"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="2"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="3"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="4"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="5"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="6"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="7"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="8"){
      pressedBall1=!pressedBall1;
    }
    else if (letra=="9"){
      pressedBall1=!pressedBall1;
    }
   }
    else if (letra=="a"){
      pressedBall1=!pressedBall1;
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

   reset(String letra){
    pressedBall1 = false;
    pressedBall2 = false;
    pressedBall3 = false;
    pressedBall4 = false;
    pressedBall5 = false;
    pressedBall6 = false;
   }

}