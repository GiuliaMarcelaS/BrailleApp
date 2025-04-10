import 'package:braille_app/components/finished.dart';
import 'package:flutter/material.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Finished(
      image: 'assets/images/Layer_2.png',
      negrito: "Tudo pronto!",
      texto: 'Agora é só começar a explorar!',
      botao: 'Continuar',
    );
  }
}
