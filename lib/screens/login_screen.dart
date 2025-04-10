import 'package:braille_app/components/auth_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _register(BuildContext context) {
    Navigator.of(context).pushNamed('/register-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Permite o layout ajustar-se quando o teclado aparece
      backgroundColor: Color(0xFFDDE9DD),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE9DD),
        title: Text('Login'),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.black)),
        actions: [
          Container(
            width: screenWidth * 20 / 360,
            margin: EdgeInsets.only(right: screenWidth * 25 / 360),
            child: Image.asset('assets/images/muiraq_preto.png'),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 36 / 800),
                      child: Image.asset('assets/images/group12.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 16 / 360),
                      child: AuthForm(),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 20 / 800),
                          width: screenWidth * 328 / 360,
                          height: screenHeight * 50 / 800,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: screenWidth * 6 / 360),
                                  child:
                                      Image.asset('assets/images/google.png'),
                                ),
                                Text(
                                  'Continue com Google',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 1 / 40),
                        SizedBox(
                          width: screenWidth * 328 / 360,
                          height: screenHeight * 50 / 800,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: screenWidth * 6 / 360),
                                  child:
                                      Image.asset('assets/images/facebook.png'),
                                ),
                                Text(
                                  'Continue com Facebook',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 30 / 800),
                          height: 0.5,
                          width: screenWidth * 300 / 360,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Primeira vez por aqui?',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () => _register(context),
                              child: Text(
                                'Crie uma conta',
                                style: TextStyle(color: Color(0xFF1CB9C5)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
