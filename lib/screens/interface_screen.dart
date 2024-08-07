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
    Provider.of<Information1>(context, listen: false).getDados(auth.token ?? "", auth.userId ?? "");
  }
  void _modulos(BuildContext context){
    // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final UserData userdata = args['userdata'];
    // final Passer passer = args['passer'];
    final modulo = Provider.of<Passer>(context,listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    modulo.getModulo(auth.token??'', auth.userId??"");
    modulo.getTopico(auth.token??'', auth.userId??"");
    Navigator.of(context).pushNamed('/modulos-screen',);
}

  void _learn(BuildContext context){
    // final modulo = Provider.of<Passer>(context);
    // final auth = Provider.of<Auth>(context);
    // modulo.getModulo(auth.token??'', auth.userId??"");
    Navigator.of(context).pushNamed('/learn-screen');
}

  void _traduzir(BuildContext context){
    Navigator.of(context).pushNamed('/tabs-screen');
}

  final bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    final teste = Provider.of<Teste>(context);
    final graphic = Provider.of<Graphic>(context);
    final auth = Provider.of<Auth>(context);
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
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(onPressed: (() => _modulos(context)), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: const Size.fromWidth(350)), child: const Text('Aprender')
                ),
                ),
             Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(onPressed: (() => _learn(context)), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: const Size.fromWidth(350)), child: const Text('Praticar')
                ),
                ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(onPressed: _isButtonDisabled ? null : (() {_traduzir(context);
             // graphic.getClicks(auth.userId??'',auth.token??'');
              }), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: const Size.fromWidth(350)), child: const Text('Traduzir')
              ),
              ),
            
              Container(
                margin: const EdgeInsets.only(top:10),
                child: const Text('Bem-Vindo!', style: TextStyle(color: Colors.white),),
                )
          ],
        ),
        backgroundColor: Color(0xFFDDE9DD),
        );
  }
}