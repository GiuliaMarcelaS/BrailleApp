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
    this.translation = "a",
    
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

   void translate(){
    if (translation=="a"){
      pressedBall1=!pressedBall1;
    }
    notifyListeners();
   }

}