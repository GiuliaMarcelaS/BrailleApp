import 'package:braille_app/components/ball_item.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/fase_list.dart';
import '../models/fases.dart';
import 'fase_item.dart';


class BallsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<BallsList>(context);
  final List<Ball> loadedBalls = provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedBalls.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (_) => loadedBalls[i], 
        child: BallItem()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      );
  }
}