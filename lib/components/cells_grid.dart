import 'package:braille_app/components/ball_item.dart';
import 'package:braille_app/components/cell_item.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:braille_app/models/cells_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/fase_list.dart';
import '../models/fases.dart';
import 'fase_item.dart';


class CellsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<CellsList>(context);
  final List<Ball> loadedCells = provider.items;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedCells.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedCells[i], 
          child: CellItem()),
        ),
    );
  }
}