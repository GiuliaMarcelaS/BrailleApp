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

  @override
  Widget build(BuildContext context) {
    final graphic = Provider.of<Graphic>(context);
    final auth = Provider.of<Auth>(context);
    int highestValue = 0;
    List highestValueJanuary = [graphic.totalAlphabetJanuary2[0], graphic.totalAlphabetJanuary2[1], graphic.totalAlphabetJanuary2[2], graphic.totalAlphabetJanuary2[3]];
    List highestValueFebruary = [graphic.totalAlphabetFebruary2[0], graphic.totalAlphabetFebruary2[1], graphic.totalAlphabetFebruary2[2], graphic.totalAlphabetFebruary2[3]];
    List highestValueMarch = [graphic.totalAlphabetMarch2[0], graphic.totalAlphabetMarch2[1], graphic.totalAlphabetMarch2[2], graphic.totalAlphabetMarch2[3]];
    List highestValueApril = [graphic.totalAlphabetApril2[0], graphic.totalAlphabetApril2[1], graphic.totalAlphabetApril2[2], graphic.totalAlphabetApril2[3]];
    List highestValueMay = [graphic.totalAlphabetMay2[0], graphic.totalAlphabetMay2[1], graphic.totalAlphabetMay2[2], graphic.totalAlphabetMay2[3]];
    List highestValueJune = [graphic.totalAlphabetJune2[0], graphic.totalAlphabetJune2[1], graphic.totalAlphabetJune2[2], graphic.totalAlphabetJune2[3]];
    List highestValueJuly = [graphic.totalAlphabetJuly2[0], graphic.totalAlphabetJuly2[1], graphic.totalAlphabetJuly2[2], graphic.totalAlphabetJuly2[3]];
    List highestValueAugust = [graphic.totalAlphabetAugust2[0], graphic.totalAlphabetAugust2[1], graphic.totalAlphabetAugust2[2], graphic.totalAlphabetAugust2[3]];
    List highestValueSeptember = [graphic.totalAlphabetSeptember2[0], graphic.totalAlphabetSeptember2[1], graphic.totalAlphabetSeptember2[2], graphic.totalAlphabetSeptember2[3]];
    List highestValueOctober = [graphic.totalAlphabetOctober2[0], graphic.totalAlphabetOctober2[1], graphic.totalAlphabetOctober2[2], graphic.totalAlphabetOctober2[3]];
    List highestValueNovember = [graphic.totalAlphabetNovember2[0], graphic.totalAlphabetNovember2[1], graphic.totalAlphabetNovember2[2], graphic.totalAlphabetNovember2[3]];
    List highestValueDecember = [graphic.totalAlphabetDecember2[0], graphic.totalAlphabetDecember2[1], graphic.totalAlphabetDecember2[2], graphic.totalAlphabetDecember2[3]];
    int returnHighestValue(){
      for(int i = 0; i<2; i++){
        if(graphic.totalAlphabetJanuary2[i+1]>graphic.totalAlphabetJanuary2[i]){
          highestValueJanuary[0] = graphic.totalAlphabetJanuary2[i+1];
        }
        if(graphic.totalAlphabetFebruary2[i+1]>graphic.totalAlphabetFebruary2[i]){
          highestValueFebruary[1] = graphic.totalAlphabetFebruary2[i+1];
        }
        if(graphic.totalAlphabetMarch2[i+1]>graphic.totalAlphabetMarch2[i]){
          highestValueMarch[2] = graphic.totalAlphabetMarch2[i+1];
        }
        if(graphic.totalAlphabetApril2[i+1]>graphic.totalAlphabetApril2[i]){
          highestValueApril[3] = graphic.totalAlphabetApril2[i+1];
        }
        if(graphic.totalAlphabetMay2[i+1]>graphic.totalAlphabetMay2[i]){
          highestValueMay[4] = graphic.totalAlphabetMay2[i+1];
        }
        if(graphic.totalAlphabetJune2[i+1]>graphic.totalAlphabetJune2[i]){
          highestValueJune[5] = graphic.totalAlphabetJune2[i+1];
        }
        if(graphic.totalAlphabetJuly2[i+1]>graphic.totalAlphabetJuly2[i]){
          highestValueJuly[6] = graphic.totalAlphabetJuly2[i+1];
        }
        if(graphic.totalAlphabetAugust2[i+1]>graphic.totalAlphabetAugust2[i]){
          highestValueAugust[7] = graphic.totalAlphabetAugust2[i+1];
        }
        if(graphic.totalAlphabetSeptember2[i+1]>graphic.totalAlphabetSeptember2[i]){
          highestValueSeptember[8] = graphic.totalAlphabetSeptember2[i+1];
        }
        if(graphic.totalAlphabetOctober2[i+1]>graphic.totalAlphabetOctober2[i]){
          highestValueOctober[9] = graphic.totalAlphabetOctober2[i+1];
        }
        if(graphic.totalAlphabetNovember2[i+1]>graphic.totalAlphabetNovember2[i]){
          highestValueNovember[10] = graphic.totalAlphabetNovember2[i+1];
        }
        if(graphic.totalAlphabetDecember2[i+1]>graphic.totalAlphabetDecember2[i]){
          highestValueDecember[11] = graphic.totalAlphabetDecember2[i+1];
        }
      }
      return highestValue;
    }
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
            maxY: 20,
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
                  FlSpot(6, graphic.totalAlphabetDecember2[0].toDouble()),
                  FlSpot(5, graphic.totalAlphabetNovember2[0].toDouble()),
                  FlSpot(4, graphic.totalAlphabetOctober2[0].toDouble()),
                  FlSpot(3, graphic.totalAlphabetSeptember2[0].toDouble()),
                  FlSpot(2, graphic.totalAlphabetAugust2[0].toDouble()),
                  FlSpot(1, graphic.totalAlphabetJuly2[0].toDouble()),
                ]
              ),
              LineChartBarData(
                spots: [
                  FlSpot(6, graphic.totalAlphabetDecember2[1].toDouble()),
                  FlSpot(5, graphic.totalAlphabetNovember2[1].toDouble()),
                  FlSpot(4, graphic.totalAlphabetOctober2[1].toDouble()),
                  FlSpot(3, graphic.totalAlphabetSeptember2[1].toDouble()),
                  FlSpot(2, graphic.totalAlphabetAugust2[1].toDouble()),
                  FlSpot(1, graphic.totalAlphabetJuly2[1].toDouble()),
                ],
                color: Colors.yellow
              ),
              LineChartBarData(
                spots: [
                  FlSpot(6, graphic.totalAlphabetDecember2[2].toDouble()),
                  FlSpot(5, graphic.totalAlphabetNovember2[2].toDouble()),
                  FlSpot(4, graphic.totalAlphabetOctober2[2].toDouble()),
                  FlSpot(3, graphic.totalAlphabetSeptember2[2].toDouble()),
                  FlSpot(2, graphic.totalAlphabetAugust2[2].toDouble()),
                  FlSpot(1, graphic.totalAlphabetJuly2[2].toDouble()),
                ],
                color: Colors.red
              ),
              LineChartBarData(
                spots: [
                  FlSpot(6, graphic.totalAlphabetDecember2[3].toDouble()),
                  FlSpot(5, graphic.totalAlphabetNovember2[3].toDouble()),
                  FlSpot(4, graphic.totalAlphabetOctober2[3].toDouble()),
                  FlSpot(3, graphic.totalAlphabetSeptember2[3].toDouble()),
                  FlSpot(2, graphic.totalAlphabetAugust2[3].toDouble()),
                  FlSpot(1, graphic.totalAlphabetJuly2[3].toDouble()),
                ],
                color: Colors.green
              ),
            ]
          )
        ),
      ),
    );
  }
}