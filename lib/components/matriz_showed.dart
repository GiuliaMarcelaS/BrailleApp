import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:braille_app/models/braillecell.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/models/ball.dart';

class MatrizShowed extends StatefulWidget {
  int id;

  MatrizShowed({
    super.key,
    this.id =0,
    });

  @override
  State<MatrizShowed> createState() => _MatrizShowedState();
}

class _MatrizShowedState extends State<MatrizShowed> {
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<CellsList>(context);
     final List<Ball> loadedCells = provider.items;
    final cell = Provider.of<Cell>(context);
    final ball = Provider.of<Ball>(context);
    final auth = Provider.of<Auth>(context, listen: false);
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (ctx, i)=> VerticalDivider(width: 15,color: Colors.transparent,),
         padding: const EdgeInsets.all(10),
         itemCount: loadedCells.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedCells[i],
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      child: Icon(
                        ball.pressedBall1? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                  Container(
                      child: Icon(
                        ball.pressedBall2? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                    
                ],
              ),
               Row(
                children: [
                  Container(
                      child: Icon(
                        ball.pressedBall3? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                     Container(
                      child: Icon(
                        ball.pressedBall4? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                ],
              ),
               Row(
                children: [
                   Container(
                      child: Icon(
                        ball.pressedBall5? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                      Container(
                      child: Icon(
                        ball.pressedBall6? Icons.circle : Icons.circle_outlined,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}