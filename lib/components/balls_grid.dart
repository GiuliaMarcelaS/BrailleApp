// cria grid para celula interativa

import 'package:braille_app/components/ball_item.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/balls_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BallsGrid extends StatelessWidget {
  const BallsGrid({super.key});


  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<BallsList>(context);
  final List<Ball> loadedBalls = provider.items;
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedBalls.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (_) => loadedBalls[i], 
          child: const BallItem()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
        ),
    );
  }
}