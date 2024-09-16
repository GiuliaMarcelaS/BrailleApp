import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/graphic.dart';
import 'package:braille_app/models/information_1.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/teste.dart';
import 'package:braille_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final auth = Provider.of<Auth>(context, listen: false);
    Provider.of<Information1>(context, listen: false)
        .getDados(auth.token ?? "", auth.userId ?? "");
  }

  void _modulos(BuildContext context) {
    final modulo = Provider.of<Passer>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    modulo.getModulo(auth.token ?? '', auth.userId ?? "");
    modulo.getTopico(auth.token ?? '', auth.userId ?? "");
    modulo.getTelaM(auth.token ?? '', auth.userId ?? "");

    Navigator.of(context).pushNamed(
      '/tabs-screen-2',
      arguments: {
        'initialIndex': 1
      }, // Passa o índice da aba desejada e outros argumentos, se necessário
    );
  }

  void _learn(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/tabs-screen-2',
      arguments: {'initialIndex': 2}, // Passa o índice da aba desejada
    );
  }

  void _traduzir(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/tabs-screen-2',
      arguments: {'initialIndex': 0}, // Passa o índice da aba desejada
    );
  }

  final bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final teste = Provider.of<Teste>(context);
    final graphic = Provider.of<Graphic>(context);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.all(29),
            margin: const EdgeInsets.only(top: 100, bottom: 5),
            alignment: Alignment.center,
            width: screenWidth * 290 / 360,
            height: screenHeight * 100 / 360,
            child: Image.asset(
              'assets/images/group12.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: screenHeight * 20 / 360,
            child: const Text('Muiraquitã em Braille',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 26)),
          ),
          Container(
            width: screenWidth * 0.80,
            height: screenHeight * 50 / 800,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: (() => _modulos(context)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF208B52),
                    foregroundColor: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.black),
                child: const Text('Aprender')),
          ),
          Container(
            width: screenWidth * 0.80,
            height: screenHeight * 50 / 800,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: (() => _learn(context)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF208B52),
                    foregroundColor: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.black),
                child: const Text('Praticar')),
          ),
          Container(
            width: screenWidth * 0.80,
            height: screenHeight * 50 / 800,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: _isButtonDisabled
                    ? null
                    : (() {
                        _traduzir(context);
                        // graphic.getClicks(auth.userId??'',auth.token??'');
                      }),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF208B52),
                    foregroundColor: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.black),
                child: const Text('Traduzir')),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: const Text(
              'Bem-Vindo!',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFDDE9DD),
    );
  }
}
