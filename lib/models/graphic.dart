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

  List UIDs = [];
  num totalAlphabet = 0;

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
  print(dados);
  dias.clear();
  dados.forEach((id, dados){
    dias.add(id);
  });

  dias10.clear();
  dados10.forEach((id, dados){
    dias10.add(id);
  });
  print(dias);
  print(dias10);

  for(var dia in dias){
    final response2 = await http.get(Uri.parse("${Constants.BASE_URL}/users/$user/clicks/2023/September/$dia.json?auth=$token"));
    Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
    print('$dados2 esse formato');

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
print('$alphabet2Current teste');
  }
  notifyListeners();
}
   Future<void> getUIDs(String token, String userId) async{

  final response = await http.get(Uri.parse("${Constants.BASE_URL}/users/2023.json?auth=$token"));
  Map<dynamic, dynamic> dados = jsonDecode(response.body);
  dias.clear();
  dados.forEach((id, dados){
    print(id);
    UIDs.add(id);
  });


  dias.clear();
  for(int i = 0; i<UIDs.length; i++)
  {
    var formatter = DateFormat.MMM().format(DateTime.now());
  final response2 = await http.get(Uri.parse("${Constants.BASE_URL}/users/${UIDs[i]}/clicks/2023/$formatter.json?auth=$token"));
  Map<dynamic, dynamic> dados2 = jsonDecode(response2.body);
  dados.forEach((id, dados2){
    dias.add(id);
  });
 
  for(var dia in dias)
  {for(int i = 0; i<UIDs.length; i++)
  {
    var formatter = DateFormat.MMMM().format(DateTime.now());
  final response3 = await http.get(Uri.parse("${Constants.BASE_URL}/users/${UIDs[i]}/clicks/2023/$formatter/$dia.json?auth=$token"));
  Map<dynamic, dynamic> dados3 = jsonDecode(response3.body);

  totalAlphabet+=dados3['alfabeto'];
  }}


  notifyListeners();
}
}}