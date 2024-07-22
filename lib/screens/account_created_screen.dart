import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/finished.dart';
import 'package:braille_app/models/information_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  void _about_you_1(BuildContext context){
    
    Navigator.of(context).pushNamed('/about-you-1-screen');
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final name = Provider.of<Information1>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Finished(
      image: 'assets/images/Layer_1.png',
      negrito: "Estamos felizes por você estar aqui!",
      texto:'Seu perfil foi criado com sucesso.',
      botao: 'Continuar',
      rota: (){
        _about_you_1(context);
        name.saveName(auth.token??'', auth.userId??'');
        });
  }
}