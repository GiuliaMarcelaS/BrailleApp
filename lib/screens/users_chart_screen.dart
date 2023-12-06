import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../models/graphic.dart';

class UsersChartScreen extends StatefulWidget {
  const UsersChartScreen({super.key});

  @override
  State<UsersChartScreen> createState() => _UsersChartScreenState();
}

class _UsersChartScreenState extends State<UsersChartScreen> {

   monthNumberConvertor(int month){
    if(month == 1||month == -11){
      return 'Jan';
    }
    else if(month == 2||month == -10){
      return 'Fev';
    }
    else if(month == 3||month == -9){
      return 'Mar';
    }
    else if(month == 4||month == -8){
      return 'Abr';
    }
    else if(month == 5||month == -7){
      return 'Mai';
    }
    else if(month == 6||month == -6){
      return 'Jun';
    }
    else if(month == 7||month == -5){
      return 'Jul';
    }
    else if(month == 8||month == -4){
      return 'Ago';
    }
    else if(month == 9||month == -3){
      return 'Set';
    }
    else if(month == 10||month == -2){
      return 'Out';
    }
    else if(month == 11||month == -1){
      return 'Nov';
    }
    else if(month == 12||month == 0){
      return 'Dez';
    }
  }

   List<String> get groupedClicks {
    return List.generate(6, (index) {
      final month = monthNumberConvertor((DateTime.now().month)-index);
        return month;
      },
    );
  }

  double alphabetDecember = 0;

    // @override
    //  initState(){
    //   super.initState();
    // //  final graphic = Provider.of<Graphic>(context);
    //   final auth = Provider.of<Auth>(context, listen: false);
    //  // alphabetDecember = 0;
    //   Provider.of<Graphic>(context).getUIDs(auth.token??'', auth.userId??'');
    // }
  @override
  Widget build(BuildContext context) {
   final graphic = Provider.of<Graphic>(context);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("gráfico geral"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 50, top: 50, bottom: 50),
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 7,
            minY: 0,
            maxY: 200,
            titlesData: FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),axisNameWidget: Text('Alfabeto')),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  interval: 1,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    String month = '';
                    switch(value.toInt()){
                      case 1:
                      month = groupedClicks[5].toString();
                      break;
                      
                      case 2:
                      month = groupedClicks[4].toString();
                      break;

                      case 3:
                      month = groupedClicks[3].toString();
                      break;

                      case 4:
                      month = groupedClicks[2].toString();
                      break;

                      case 5:
                      month = groupedClicks[1].toString();
                      break;

                      case 6:
                      month = groupedClicks[0].toString();
                      break;
                    }
                    return Text(month);
                  },
                )
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(6, graphic.totalAlphabetDecember2.toDouble()),
                  FlSpot(5, graphic.totalAlphabetNovember2.toDouble()),
                  FlSpot(4, graphic.totalAlphabetOctober2.toDouble()),
                  FlSpot(3, graphic.totalAlphabetSeptember2.toDouble()),
                  FlSpot(2, graphic.totalAlphabetAugust2.toDouble()),
                  FlSpot(1, graphic.totalAlphabetJuly2.toDouble()),
                ]
              )
            ]
          )
        ),
      ),
    );
  }
}