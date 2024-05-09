import 'package:flutter/material.dart';

class SwitchAuth extends StatelessWidget {
  const SwitchAuth({super.key});
  void _login(BuildContext context){
    Navigator.of(context).pushNamed('/login-screen');
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: ElevatedButton(onPressed: (){}, child: Text("Criar conta")),
          width: MediaQuery.of(context).size.width-80,
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height-480,
          ),
        SizedBox(
          child: ElevatedButton(onPressed: ()=>_login(context), child: Text("Já tenho uma conta")),
          width: MediaQuery.of(context).size.width-80,
          ),
      ],
    );
  }
}