import 'package:braille_app/models/ball.dart';
import 'package:flutter/material.dart';

class CellsList with ChangeNotifier{
  final List<Ball> _items = [];

  List<Ball> get items => [..._items];

  final bool pressedBall1;
   int id;
  CellsList({
    this.pressedBall1 = false,
    this.id = 0,
  });

    addCells(String frase){
      int phraseLength = frase.length;
      _items.clear();
      //id = 0;
      for(int i =0; i<phraseLength;i++)
      {
       // _items.add(Ball());
        if (frase[i] =='a'){
      _items.add(Ball(pressedBall1: true,pressedBall2: false,pressedBall3: false, pressedBall4: false,pressedBall5: false,pressedBall6: false));
      id=id+1;
      }
    else  if (frase[i] =='b'){
      _items.add(Ball(pressedBall1: true,pressedBall2: false,pressedBall3: true, pressedBall4: false,pressedBall5: false,pressedBall6: false));
      id=id+1;
      }
      }
    notifyListeners();
  }



  
  //   translate(String letra, int id){
  //     for(int i = 0; i<letra.length;i++){
  //     pressedBall1=false;
  //     pressedBall2=false;
  //     pressedBall3=false;
  //     pressedBall4=false;
  //     pressedBall5=false;
  //     pressedBall6=false;
  //     if (letra[i] =='a'){
  //     pressedBall1=!pressedBall1;
  //     pressedBall11=pressedBall1;
  //     }
  //   else if (letra[i]=="b"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall3=!pressedBall3;
  //     pressedBall11=pressedBall1;
  //     pressedBall33=pressedBall3;
  //   }
  //   else if (letra[i]=="c"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //   }
  //   else if (letra[i]=="d"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall4=!pressedBall4;
  //   }
  //   else if (letra[i]=="e"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall4=!pressedBall4;
  //   }
  //   else if (letra[i]=="f"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //   }
  //   else if (letra[i]=="g"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //   }
  //   else if (letra[i]=="h"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //   }
  //   else if (letra[i]=="i"){
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //   }
  //   else if (letra[i]=="j"){
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //   }
  //   else if (letra[i]=="k"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="l"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall3=!pressedBall3;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="m"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="n"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="o"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="p"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="q"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="r"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="s"){
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="t"){
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //   }
  //   else if (letra[i]=="u"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall5=!pressedBall5;
  //     pressedBall6=!pressedBall6;
  //   }
  //   else if (letra[i]=="v"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall3=!pressedBall3;
  //     pressedBall5=!pressedBall5;
  //     pressedBall6=!pressedBall6;
  //   }
  //   else if (letra[i]=="w"){
  //     pressedBall2=!pressedBall2;
  //     pressedBall3=!pressedBall3;
  //     pressedBall4=!pressedBall4;
  //     pressedBall6=!pressedBall6;
  //   }
  //   else if (letra[i]=="x"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall5=!pressedBall5;
  //     pressedBall6=!pressedBall6;
  //   }
  //   else if (letra[i]=="y"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall2=!pressedBall2;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //     pressedBall6=!pressedBall6;
  //   }
  //   else if (letra[i]=="z"){
  //     pressedBall1=!pressedBall1;
  //     pressedBall4=!pressedBall4;
  //     pressedBall5=!pressedBall5;
  //     pressedBall6=!pressedBall6;
  //   }
  //     }
  //   notifyListeners();
  //  }
}