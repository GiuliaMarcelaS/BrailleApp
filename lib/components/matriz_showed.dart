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
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 50, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1)),
      child: Expanded(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          // separatorBuilder: (ctx, i)=> const VerticalDivider(width: 15,color: Colors.transparent,),
          padding: const EdgeInsets.all(10),
          itemCount: loadedCells.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: loadedCells[i],
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls1[i] == 1
                          ? Icons.circle
                          : (ballt.balls1[i] == 2 ? null : null),
                    ),
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls2[i] == 1
                          ? Icons.circle
                          : (ballt.balls2[i] == 2 ? null : null),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls3[i] == 1
                          ? Icons.circle
                          : (ballt.balls3[i] == 2 ? null : null),
                    ),
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls4[i] == 1
                          ? Icons.circle
                          : (ballt.balls4[i] == 2 ? null : null),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls5[i] == 1
                          ? Icons.circle
                          : (ballt.balls5[i] == 2 ? null : null),
                    ),
                    Icon(
                      color: Colors.grey,
                      size: 6,
                      ballt.balls6[i] == 1
                          ? Icons.circle
                          : (ballt.balls6[i] == 2 ? null : null),
                    ),
                  ],
                ),
              ],
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 12.0,
              childAspectRatio: 0.6,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 4.0),
        ),
      ),
    );
  }
}
