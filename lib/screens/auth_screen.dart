import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255,13,110,69)),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Muiraquitã Braille',
                  style: TextStyle(
                    fontSize: 45
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