import 'package:braille_app/models/finished.dart';
import 'package:flutter/material.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  void _about_you_1(BuildContext context){
    Navigator.of(context).pushNamed('/about-you-1-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Finished(
      image: 'assets/images/Layer_1.png',
      negrito: "Estamos felizes por você estar aqui!",
      texto:'Seu perfil foi criado com sucesso.',
      botao: 'Continuar',
      rota: ()=>_about_you_1,);
  }
}