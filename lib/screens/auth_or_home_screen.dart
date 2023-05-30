import 'package:braille_app/screens/auth_screen.dart';
import 'package:braille_app/screens/interface_screen.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:braille_app/models/auth.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth? const Interface(): const AuthScreen();
  }
}