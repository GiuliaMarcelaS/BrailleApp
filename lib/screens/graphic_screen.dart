import 'package:braille_app/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//import '../models/graphic.dart';

// ignore: must_be_immutable
class GraphicScreen extends StatelessWidget {
  List<int> alphabetClicksSum = [2,1,3,4,5,6,7,8,9,10,11,12];
  List<int> wordsClicksSum = [5,6,3,4,5,6,7,8,9,10,11,12];
  List<int> numbersClicksSum = [4,8,3,4,5,6,7,8,9,10,11,12];
  List<int> expressionsClicksSum = [2,5,3,4,5,6,7,8,9,10,11,12];
  GraphicScreen(
  {super.key});

  monthNumberConvertor(int month){
    if(month == 1||month == -11){
      return 'Janeiro';
    }
    else if(month == 2||month == -10){
      return 'Fevereiro';
    }
    else if(month == 3||month == -9){
      return 'Março';
    }
    else if(month == 4||month == -8){
      return 'Abril';
    }
    else if(month == 5||month == -7){
      return 'Maio';
    }
    else if(month == 6||month == -6){
      return 'Junho';
    }
    else if(month == 7||month == -5){
      return 'Julho';
    }
    else if(month == 8||month == -4){
      return 'Agosto';
    }
    else if(month == 9||month == -3){
      return 'Setembro';
    }
    else if(month == 10||month == -2){
      return 'Outubro';
    }
    else if(month == 11||month == -1){
      return 'Novembro';
    }
    else if(month == 12||month == 0){
      return 'Dezembro';
    }
  }
  monthStringConvertor(String month){
    if(month == 'January'){
      return 1;
    }
    else if(month == 'February'){
      return 2;
    }
    else if(month == 'March'){
      return 3;
    }
    else if(month == 'April'){
      return 4;
    }
    else if(month == 'May'){
      return 5;
    }
    else if(month == 'June'){
      return 6;
    }
    else if(month == 'July'){
      return 7;
    }
    else if(month == 'August'){
      return 8;
    }
    else if(month == 'September'){
      return 9;
    }
    else if(month == 'October'){
      return 10;
    }
    else if(month == 'November'){
      return 11;
    }
    else if(month == 'December'){
      return 12;
    }
  }

  List<Map<String, dynamic>> get groupedAlphabetClicks {
    return List.generate(2, (index) {
      final month = monthNumberConvertor((DateTime.now().month)-index);
      final alphabetClicks = alphabetClicksSum[index];
        return {'month': month, 'AlphabetClicks': alphabetClicks};
      },
    );
  }
  List<Map<String, dynamic>> get groupedWordClicks {
    return List.generate(2, (index) {
      final month = monthNumberConvertor((DateTime.now().month)-index);
      final wordClicks = wordsClicksSum[index];
        return {'month': month, 'wordClicks': wordClicks};
      },
    );
  }
  List<Map<String, dynamic>> get groupedNumberClicks {
    return List.generate(2, (index) {
      final month = monthNumberConvertor((DateTime.now().month)-index);
      final numberClicks = numbersClicksSum[index];
        return {'month': month, 'NumberClicks': numberClicks};
      },
    );
  }
  List<Map<String, dynamic>> get groupedExpressionClicks {
    return List.generate(2, (index) {
      final month = monthNumberConvertor((DateTime.now().month)-index);
      final expressionClicks = expressionsClicksSum[index];
        return {'month': month, 'ExpressionClicks': expressionClicks};
      },
    );
  }

  double get _monthsTotalAlphabetClicks{
    return groupedAlphabetClicks.fold(0.0, (sum, alphabetClicks){
      return sum + alphabetClicks['AlphabetClicks'];
    });
  }
  double get _monthsTotalWordClicks{
    return groupedWordClicks.fold(0.0, (sum, wordClicks){
      return sum + wordClicks['WordClicks'];
    });
  }
  double get _monthsTotalNumberClicks{
    return groupedNumberClicks.fold(0.0, (sum, numberClicks){
      return sum + numberClicks['NumberClicks'];
    });
  }
  double get _monthsTotalExpressionClicks{
    return groupedExpressionClicks.fold(0.0, (sum, expressionClicks){
      return sum + expressionClicks['ExpressionClicks'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: groupedAlphabetClicks.map((clicks){
            return ChartBar(
              month: clicks['month'].toString(),
              alphabetClicks: clicks['AlphabetClicks'] as int,
           //   wordClicks: clicks['WordClicks'] as int,
            //  numberClicks: clicks['NumberClicks'] as int,
             // expressionClicks: clicks['ExpressionClicks'] as int,
              percentage1: (clicks['AlphabetClicks'] as double)/_monthsTotalAlphabetClicks,
            //  percentage2: (clicks['WordClicks'] as double)/_monthsTotalWordClicks,
           //   percentage3: (clicks['NumberClicks'] as double)/_monthsTotalNumberClicks,
            //  percentage4: (clicks['ExpressionClicks'] as double)/_monthsTotalExpressionClicks,
            );
          }).toList(),
          
        ),
      ),
    );
  }
}
