import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/fase_list.dart';
import '../models/fases.dart';
import 'fase_item.dart';

class FaseGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<FaseList>(context);
  final List<Fase> loadedFases = provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedFases.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (_) => loadedFases[i], 
        child: FaseItem()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      );
  }
}