import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/graphic.dart';

class GraphicScreen extends StatelessWidget {
  GraphicScreen(//this.recentAlphabetClicks, 
  {super.key});

 // final List recentAlphabetClicks;
  final List tabs = ['alphabet','words','numbers', 'expressions'];
  var aba;
  var clicks;
  List<Map<String, Object>> get groupedClicks {
    return List.generate(
      4,
      (index) {
        for(var tab in tabs){
          aba = tab;
        }

        getClicks (int providerClicks){
          clicks = providerClicks;
        }
        return {'tab': aba, 'clicks': clicks};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
