import 'package:flutter/material.dart';


class Interface extends StatelessWidget {
 const Interface({super.key});

  void _modulos(BuildContext context){
    Navigator.of(context).pushNamed('/modulos-screen');
}

  void _traduzir(BuildContext context){
    Navigator.of(context).pushNamed('/traducao-screen');
}
  final bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(29),
              margin: const EdgeInsets.only(top: 100, bottom: 5),
              alignment: Alignment.center,
              width: 180,
              height: 200,
              child: Image.asset('assets\\images\\muiraquita3.jpg',
              fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 20,
              child: const Text('Muiraquitã em Braille',style: TextStyle(color: Colors.white)),
              ),
            Container(
              margin: const EdgeInsets.only(top: 125),
              child: ElevatedButton(onPressed: _isButtonDisabled ? null : (() => _traduzir(context)), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: const Size.fromWidth(350)), child: const Text('Realizar Tradução')
              ),
              ),
             Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(onPressed: (() => _modulos(context)), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: const Size.fromWidth(350)), child: const Text('Aprender Braille')
                ),
                ),
            
              Container(
                margin: const EdgeInsets.only(top:70),
                child: const Text('Bem-Vindo!', style: TextStyle(color: Colors.white),),
                )
          ],
        ),
        backgroundColor: const Color.fromARGB(255,13,110,69),
        );
  }
}