import 'dart:convert';

import 'package:braille_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Graphic with ChangeNotifier {
  final String click;

  Graphic({
    this.click = '',
  });

  List<String> dias = [];
  List<String> dias10 = [];
  num alphabet = 0;
  num alphabet2Current = 0;
  num words = 0;
  num words2Current = 0;
  num numbers = 0;
  num numbers2Current = 0;
  num expressions = 0;
  num expressions2Current = 0;

  List uids = [];
  List salvaDias = [];
  List salvaMeses = [];
  num totalAlphabetJanuary = 0;
  num totalAlphabetJanuary2 = 0;
  num totalAlphabetFebruary = 0;
  num totalAlphabetFebruary2 = 0;
  num totalAlphabetMarch = 0;
  num totalAlphabetMarch2 = 0;
  num totalAlphabetApril = 0;
  num totalAlphabetApril2 = 0;
  num totalAlphabetMay = 0;
  num totalAlphabetMay2 = 0;
  num totalAlphabetJune = 0;
  num totalAlphabetJune2 = 0;
  num totalAlphabetJuly = 0;
  num totalAlphabetJuly2 = 0;
  num totalAlphabetAugust = 0;
  num totalAlphabetAugust2 = 0;
  num totalAlphabetSeptember = 0;
  num totalAlphabetSeptember2 = 0;
  num totalAlphabetOctober = 0;
  num totalAlphabetOctober2 = 0;
  num totalAlphabetNovember = 0;
  num totalAlphabetNovember2 = 0;
  num totalAlphabetDecember = 0;
  num totalAlphabetDecember2 = 0;

  int sinal = 0;

  List sixMonths = [];

   Future<void> getClicks(String token, String userId, String user) async{

    alphabet = 0;
    alphabet2Current = 0;
    words = 0;
    words2Current = 0;
    numbers = 0;
    numbers2Current = 0;
    expressions = 0;
    expressions2Current = 0;
   final response = await http.get(Uri.parse("${Constants.BASE_URL}/users/$user/clicks/2023/September.json?auth=$token"));
   final response10 = await http.get(Uri.parse("${Constants.BASE_URL}/users/$user/clicks/2023/October.json?auth=$token"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  Map<dynamic, dynamic> dados10 = jsonDecode(response10.body);
 // print(dados);
  dias.clear();
  dados.forEach((id, dados){
    dias.add(id);
  });

  dias10.clear();
  dados10.forEach((id, dados){
    dias10.add(id);
  });
//  print(dias);
//  print(dias10);

  for(var dia in dias){
    final response2 = await http.get(Uri.parse("${Constants.BASE_URL}/users/$user/clicks/2023/September/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
 //   print('$dados2 esse formato');

    if(dados2.containsKey('alfabeto') )
    {alphabet += dados2['alfabeto'];}

    if(dados2.containsKey('palavras') )
    {words += dados2['palavras'];}

    if(dados2.containsKey('números') )
    {numbers += dados2['números'];}
    
     if(dados2.containsKey('expressões') )
    {expressions += dados2['expressões'];}

  }
  for(var dia in dias10){
    final response20 = await http.get(Uri.parse("${Constants.BASE_URL}/users/$user/clicks/2023/October/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados20 = jsonDecode(response20.body);
 //   print(dados2);
    if(dados20.containsKey('alfabeto') )
    {alphabet2Current += dados20['alfabeto'];}

    if(dados20.containsKey('palavras') )
    {words2Current += dados20['palavras'];}

    if(dados20.containsKey('números') )
    {numbers2Current += dados20['números'];}
    
     if(dados20.containsKey('expressões') )
    {expressions2Current += dados20['expressões'];}
//print('$alphabet2Current teste');
  }
  notifyListeners();
}

   Future<void> getUIDs(String token, String userId) async{

  // salva as uids
  final response = await http.get(Uri.parse("${Constants.BASE_URL}/users.json?auth=$token"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  dias.clear();
  uids.clear();
  dados.forEach((id, dados){
   uids.add(id);
  });

  totalAlphabetJanuary = 0;
  totalAlphabetFebruary = 0;
  totalAlphabetMarch = 0;
  totalAlphabetApril = 0;
  totalAlphabetMay = 0;
  totalAlphabetJune = 0;
  totalAlphabetJuly = 0;
  totalAlphabetAugust = 0;
  totalAlphabetSeptember = 0;
  totalAlphabetOctober = 0;
  totalAlphabetNovember = 0;
  totalAlphabetDecember = 0;

  // para cada uid
  for(int i = 0; i<uids.length; i++)
  {
    //pega os meses
    final availableMonths = await http.get(Uri.parse("${Constants.BASE_URL}/users/${uids[i]}/clicks/2023/.json?auth=$token"));
    Map<dynamic, dynamic> dadosMes = jsonDecode(availableMonths.body);

    salvaMeses.clear();
    dadosMes.forEach((id, dadosMes) {
    salvaMeses.add(id);
    });

    //pega os dias do mes
     for(int m = 0; m<salvaMeses.length; m++)
    {
      print(salvaMeses[m]);
    final availableDays = await http.get(Uri.parse("${Constants.BASE_URL}/users/${uids[i]}/clicks/2023/${salvaMeses[m]}.json?auth=$token"));
    Map<dynamic, dynamic> dadosDias = jsonDecode(availableDays.body);
    print("teste 2");
    
  salvaDias.clear();
  dadosDias.forEach((id, dadosDias) {
  salvaDias.add(id);
  });
  //soma clicks para cada dia
  for(int b = 0; b<salvaDias.length; b++)
 {
  print('dia ${salvaDias[b]}');
  print('user ${uids[i]}');
  final response3 = await http.get(Uri.parse("${Constants.BASE_URL}/users/${uids[i]}/clicks/2023/${salvaMeses[m]}/${salvaDias[b]}.json?auth=$token"));
  Map<dynamic, dynamic> dados3 = jsonDecode(response3.body);

  if(salvaMeses[m]=='January')
  {
    totalAlphabetJanuary+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='February')
  {
    totalAlphabetFebruary+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='March')
  {
    totalAlphabetMarch+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='April')
  {
    totalAlphabetApril+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='May')
  {
    totalAlphabetMay+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='June')
  {
    totalAlphabetJune+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='July')
  {
    totalAlphabetJuly+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='August')
  {
    totalAlphabetAugust+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='September')
  {
    totalAlphabetSeptember+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='October')
  {
    totalAlphabetOctober+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='November')
  {
    totalAlphabetNovember+=dados3['alfabeto'];
  }
  else if(salvaMeses[m]=='December')
  {
    totalAlphabetDecember+=dados3['alfabeto'];
  }
  }
 
  notifyListeners();
}
}
  totalAlphabetJanuary2 = totalAlphabetJanuary;
  totalAlphabetFebruary2 = totalAlphabetFebruary;
  totalAlphabetMarch2 = totalAlphabetMarch;
  totalAlphabetApril2 = totalAlphabetApril;
  totalAlphabetMay2 = totalAlphabetMay;
  totalAlphabetJune2 = totalAlphabetJune;
  totalAlphabetJuly2 = totalAlphabetJuly;
  totalAlphabetAugust2 = totalAlphabetAugust;
  totalAlphabetSeptember2 = totalAlphabetSeptember;
  totalAlphabetOctober2 = totalAlphabetOctober;
  totalAlphabetNovember2 = totalAlphabetNovember;
  totalAlphabetDecember2 = totalAlphabetDecember;

  notifyListeners();
}}