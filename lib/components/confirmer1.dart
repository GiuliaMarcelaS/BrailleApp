import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:braille_app/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:braille_app/models/braillecell.dart';


class Confirmer1 extends StatelessWidget {
  Confirmer1({super.key});


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final cell = Provider.of<Cell>(context, listen: false);
    return Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall1(cell,auth.token ?? '',auth.userId ?? ''),
                  icon: Icon(cell.isClicked1? Icons.circle : Icons.circle_outlined,)
                ),
           );
  
  }
}