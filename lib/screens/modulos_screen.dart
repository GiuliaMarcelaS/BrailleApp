import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/components/matriz.dart';
import 'package:braille_app/models/fases.dart';
import 'package:braille_app/data/fases_data.dart';


class ModulosScreen extends StatelessWidget {
  final List<Fase> loadedFases = fasesData;

  
  void _celula(BuildContext context){
    Navigator.of(context).pushNamed('/celula-screen');
}

  void _fase1(BuildContext context){
    Navigator.of(context).pushNamed('/fase1-screen');
}


  @override
  Widget build(BuildContext context) {
   
   // final pontosAcumulados = provider.pontosAcumulados;

    return Scaffold(
      appBar: AppBar(
        title: Text("Módulos"),),
      body:  Column(
        children: [
          Container(
            child: ElevatedButton(onPressed: (() => _celula(context)), child: Text('célula'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: Size.fromWidth(350))
                    ),
             margin: EdgeInsets.only(top:70),
          ),
           Container(
            child: ElevatedButton(onPressed: (() => _fase1(context)), child: Text('fase 1'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: Size.fromWidth(350))
                    ),
             margin: EdgeInsets.only(top:70),
          ),
           Container(
            child: ElevatedButton(onPressed: (() => _fase1(context)), child: Text('fase 2'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, fixedSize: Size.fromWidth(350))
                    ),
             margin: EdgeInsets.only(top:70),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GridView.builder(
          //     itemCount: loadedFases.length,
          //     itemBuilder: (ctx, i) => Text(loadedFases[i].title),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 3/2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //     ), 
          //     ),
          // )
        ],
      ),
    );
  }
}