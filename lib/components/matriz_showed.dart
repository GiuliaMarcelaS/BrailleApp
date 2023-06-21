import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/ball.dart';

class MatrizShowed extends StatefulWidget {

  const MatrizShowed({
    super.key,
    });

  @override
  State<MatrizShowed> createState() => _MatrizShowedState();
}

class _MatrizShowedState extends State<MatrizShowed> {
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<CellsList>(context);
     final List<Ball> loadedCells = provider.items;
    final ballt = Provider.of<Ball>(context);
   // final Ball ballt = ModalRoute.of(context)!.settings.arguments as Ball;
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
                    ballt.balls1[i]? Icons.circle : Icons.circle_outlined,
                  ),
                  Icon(
                    ballt.balls2[i]? Icons.circle : Icons.circle_outlined,
                  ),
                    
                ],
              ),
               Row(
                children: [
                  Icon(
                   ballt.balls3[i]? Icons.circle : Icons.circle_outlined,
                  ),
                     Icon(
                       ballt.balls4[i]? Icons.circle : Icons.circle_outlined,
                     ),
                ],
              ),
               Row(
                children: [
                   Icon(
                     ballt.balls5[i]? Icons.circle : Icons.circle_outlined,
                   ),
                      Icon(
                        ballt.balls6[i]? Icons.circle : Icons.circle_outlined,
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