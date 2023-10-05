import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChartBar extends StatelessWidget {

  final String month;
  final int clicks;
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
       // Text(clicks.toString()),
        SizedBox(height: 5,width: 200,),
        Row(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0
                          ),
                    
                        ),
                      ),
                      FractionallySizedBox(
                        heightFactor: 0.2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                            color: Colors.black,
                            width: 1.0
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text('alfabeto',style: TextStyle(fontSize: 8),),
                Text("(${clicks.toString()})",style: TextStyle(fontSize: 8),),
              ],
            ),
           SizedBox(width: 1,),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0
                          ),
                          
                        ),
                      ),
                        FractionallySizedBox(
                        heightFactor: 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                            color: Colors.black,
                            width: 1.0
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text('palavras',style: TextStyle(fontSize: 8),),
                Text("(${clicks.toString()})",style: TextStyle(fontSize: 8),),
              ],
            ),
           SizedBox(width: 1,),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0
                          ),
                          
                        ),
                      ),
                        FractionallySizedBox(
                        heightFactor: 0.8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(
                            color: Colors.black,
                            width: 1.0
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text('números',style: TextStyle(fontSize: 8),),
                Text("(${clicks.toString()})",style: TextStyle(fontSize: 8),),
              ],
            ),
           SizedBox(width: 1,),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0
                          ),
                          
                        ),
                      ),
                        FractionallySizedBox(
                        heightFactor: 0.6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 207, 207, 17),
                            border: Border.all(
                            color: Colors.black,
                            width: 1.0
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text('expressões',style: TextStyle(fontSize: 8),),
                Text("(${clicks.toString()})",style: TextStyle(fontSize: 8),),
              ],
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text(month),
      ],
    );
  }
}