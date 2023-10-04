import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChartBar extends StatelessWidget {

  final String month;
  final double clicks;
  final double percentage;

  const ChartBar({
    super.key,
    this.month = '',
    this.clicks = 0,
    this.percentage = 0,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(clicks.toString()),
        SizedBox(height: 5,),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        SizedBox(height: 5,),
        Text(month),
      ],
    );
  }
}