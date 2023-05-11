import 'package:braille_app/models/fases.dart';
import 'package:braille_app/models/passer.dart';
import 'package:braille_app/models/passer1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:braille_app/models/passer_item.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class FaseScreen extends StatelessWidget {
  const FaseScreen({super.key

  });

  @override
  Widget build(BuildContext context) {
     final passer2 = Provider.of<Fase>(context);
     final passer = Provider.of<Passer>(context);
     final passer1 = Provider.of<Passer1>(context);
     final auth = Provider.of<Auth>(context, listen: false);
     final fase = Provider.of<Fase>(context);
     final passarItem = Provider.of<PasserItem>(context);
   final Fase faset = ModalRoute.of(context)!.settings.arguments as Fase;
    return Scaffold(
      appBar: AppBar(
        title: Text(faset.title),
      ),
      body: Container(
                child: IconButton(
                  onPressed: () {passer.incrementaFase(faset, auth.token??'', auth.userId??'');
                  print(passer1.item);} //=> passer.passPhase1(auth.token ?? '',auth.userId ?? ''),
                  ,icon: Icon(Icons.arrow_circle_right),
                ),
      )
    );
  }
}