import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:braille_app/models/passer2.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class FaseScreen extends StatelessWidget {
  const FaseScreen({super.key

  });

  @override
  Widget build(BuildContext context) {
     final passer2 = Provider.of<Passer2>(context);
     final auth = Provider.of<Auth>(context, listen: false);
  final Fase fase = ModalRoute.of(context)!.settings.arguments as Fase;
    return Scaffold(
      appBar: AppBar(
        title: Text(fase.title),
      ),
      body: Container(
                child: IconButton(
                  onPressed: () =>passer2.habilitaFase(passer2,auth.token ?? '',auth.userId ?? '') //=> passer.passPhase1(auth.token ?? '',auth.userId ?? ''),
                  ,icon: Icon(Icons.arrow_circle_right),
                ),
      )
    );
  }
}