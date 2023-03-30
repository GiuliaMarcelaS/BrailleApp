import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

class Matriz extends StatelessWidget {
  Matriz({super.key});


  @override
  Widget build(BuildContext context) {
    final cell = Provider.of<Cell>(context);
    final auth = Provider.of<Auth>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall1(cell,auth.token ?? '',auth.userId ?? ''),
                  icon: Icon(cell.isClicked1? Icons.circle : Icons.circle_outlined,)
                ),
              ),
               Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall2(cell),
                  icon: Icon(cell.isClicked2? Icons.circle : Icons.circle_outlined,)
                ),
              ),
          ],
        ),
         Row(
          children: [
            Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall3(cell),
                  icon: Icon(cell.isClicked3? Icons.circle : Icons.circle_outlined,)
                ),
              ),
               Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall4(cell),
                  icon: Icon(cell.isClicked4? Icons.circle : Icons.circle_outlined,)
                ),
              ),
          ],
        ),
         Row(
          children: [
            Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall5(cell),
                  icon: Icon(cell.isClicked5? Icons.circle : Icons.circle_outlined,)
                ),
              ),
               Container(
                child: IconButton(
                  onPressed: () => cell.toggleBall6(cell),
                  icon: Icon(cell.isClicked6? Icons.circle : Icons.circle_outlined,)
                ),
              ),
          ],
        ),
      ],
    );
  }
}