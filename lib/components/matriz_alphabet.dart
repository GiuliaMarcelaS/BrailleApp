import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/ball.dart';

class MatrizAlphabet extends StatefulWidget {

  const MatrizAlphabet({
    super.key,
    });

  @override
  State<MatrizAlphabet> createState() => _MatrizAlphabetState();
}

class _MatrizAlphabetState extends State<MatrizAlphabet> {
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<CellsList>(context);
     final List<Ball> loadedCells = provider.items;
    final ballt = Provider.of<Ball>(context);
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (ctx, i)=> const VerticalDivider(width: 15,color: Colors.transparent,),
         padding: const EdgeInsets.all(10),
         itemCount: loadedCells.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedCells[i],
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    ballt.pressedBall1? Icons.circle : Icons.circle_outlined,
                  ),
                  Icon(
                    ballt.pressedBall2? Icons.circle : Icons.circle_outlined,
                  ),
                    
                ],
              ),
               Row(
                children: [
                  Icon(
                   ballt.pressedBall3? Icons.circle : Icons.circle_outlined,
                  ),
                     Icon(
                       ballt.pressedBall4? Icons.circle : Icons.circle_outlined,
                     ),
                ],
              ),
               Row(
                children: [
                   Icon(
                     ballt.pressedBall5? Icons.circle : Icons.circle_outlined,
                   ),
                      Icon(
                        ballt.pressedBall6? Icons.circle : Icons.circle_outlined,
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