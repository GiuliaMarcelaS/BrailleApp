import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _selectButton(BuildContext context){
    Navigator.of(context).pushNamed('/');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: const Color.fromARGB(255,13,110,69)),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Muiraquitã Braille',
                    style: TextStyle(
                      fontSize: 45
                    ),
                  ),
                ),
                AuthForm(),
              ]),
          )
        ],
      ),
    );
  }
}