// import 'package:braille_app/models/passer.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:braille_app/models/auth.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:braille_app/models/braillecell.dart';


// class Confirmer1 extends StatelessWidget {
//   Confirmer1({super.key});


//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<Auth>(context, listen: false);
//     final passer = Provider.of<Passer>(context, listen: false);
//     return Container(
//                 child: IconButton(
//                   onPressed: () => passer.incrementaFase(fase,auth.token ?? '',auth.userId ?? ''),
//                   icon: Icon(Icons.arrow_circle_right),
//                 ),
//                   margin: EdgeInsets.only(top: 500, left: 450),
//            );
  
//   }
// }