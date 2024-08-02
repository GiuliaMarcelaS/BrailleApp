import 'dart:convert';
//import 'dart:js';

import 'package:braille_app/models/passer.dart';
import 'package:braille_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserData with ChangeNotifier{
  int modulo;
  final String token;
  final String userId;

  UserData(
    this.token,
    this.userId,
  {
    this.modulo = 0,
  });

  Future<void> getModulo() async{
    final response = await http.get(Uri.parse("${Constants.BASE_URL}/users/$userId/modulo.json?auth=$token"));
    var dados = jsonDecode(response.body);
    modulo = dados;
    print('modulo = $modulo');
  }
}