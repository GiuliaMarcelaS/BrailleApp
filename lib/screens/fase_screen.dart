import 'package:braille_app/models/fases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FaseScreen extends StatelessWidget {
  const FaseScreen({super.key

  });

  @override
  Widget build(BuildContext context) {
  final Fase fase = ModalRoute.of(context)!.settings.arguments as Fase;
    return Scaffold(
      appBar: AppBar(
        title: Text(fase.title),
      ),
      body: Container(
                child: IconButton(
                  onPressed: () {} //=> passer.passPhase1(auth.token ?? '',auth.userId ?? ''),
                  ,icon: Icon(Icons.arrow_circle_right),
                ),
      )
    );
  }
}