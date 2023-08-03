import 'package:braille_app/models/alphabet_list.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:braille_app/models/number_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/ball.dart';

class MatrizNumber extends StatefulWidget {

  const MatrizNumber({
    super.key,
    });

  @override
  State<MatrizNumber> createState() => _MatrizNumberState();
}

class _MatrizNumberState extends State<MatrizNumber> {
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<NumberList>(context);
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
                    ballt.balls1[i]==1? Icons.circle : Icons.circle_outlined,
                  ),
                  Icon(
                    ballt.balls2[i]==1? Icons.circle : Icons.circle_outlined,
                  ),
                    
                ],
              ),
               Row(
                children: [
                  Icon(
                   ballt.balls3[i]==1? Icons.circle : Icons.circle_outlined,
                  ),
                     Icon(
                       ballt.balls4[i]==1? Icons.circle : Icons.circle_outlined,
                     ),
                ],
              ),
               Row(
                children: [
                   Icon(
                     ballt.balls5[i]==1? Icons.circle : Icons.circle_outlined,
                   ),
                      Icon(
                        ballt.balls6[i]==1? Icons.circle : Icons.circle_outlined,
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