import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/screens/modulos_screen.dart';

class Interface extends StatelessWidget {
 Interface({super.key});

  void _modulos(BuildContext context){
    Navigator.of(context).pushNamed('/modulos-screen');
}

  void _traduzir(BuildContext context){
    Navigator.of(context).pushNamed('/traducao-screen');
}
  bool _isButtonDisabled = false;

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
              padding: EdgeInsets.all(29),
              margin: EdgeInsets.only(top: 100, bottom: 5),
              alignment: Alignment.center,
              width: 180,
              height: 200,
              child: Image.asset('assets\\images\\muiraquita3.jpg',
              fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Text('Muiraquitã em Braille',style: TextStyle(color: Colors.white)),
              alignment: Alignment.center,
              height: 20,
             // margin: EdgeInsets.only(top: 1),
              ),
            Container(
              child: ElevatedButton(onPressed: _isButtonDisabled ? null : (() => _traduzir(context)), child: Text('Realizar Tradução'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: Size.fromWidth(350))
              ),
              margin: EdgeInsets.only(top: 125),
              ),
             Container(
                child: ElevatedButton(onPressed: (() => _modulos(context)), child: Text('Aprender Braille'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: Size.fromWidth(350))
                ),
                margin: EdgeInsets.only(top: 10),
                ),
            
              Container(
                child: Text('Bem-Vindo!', style: TextStyle(color: Colors.white),),
                margin: EdgeInsets.only(top:70),
                )
          ],
        ),
        backgroundColor: const Color.fromARGB(255,13,110,69),
        );
  }
}