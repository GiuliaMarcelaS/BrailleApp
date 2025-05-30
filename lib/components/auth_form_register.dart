import 'package:braille_app/exceptions/auth_exception.dart';
import 'package:braille_app/services/information_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthMode { signup, login }

class AuthFormRegister extends StatefulWidget {
  final double screenHeight;
  const AuthFormRegister({
    super.key,
    this.screenHeight = 0,
  });

  @override
  State<AuthFormRegister> createState() => _AuthFormRegisterState();
}

class _AuthFormRegisterState extends State<AuthFormRegister> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final AuthMode _authMode = AuthMode.signup;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'requestUri': '',
    'postBody': '',
  };

  Map<String, dynamic>? _userData;

  String welcome = 'Facebook';

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        await auth.login(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        await auth.signup(
          _authData['email']!,
          _authData['password']!,
        );
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/account-created-screen');
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    setState(() => _isLoading = false);
  }

  Future<UserCredential?> _submitGoogle() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setState(() => _isLoading = false);
        return null; // usuário cancelou o login
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/account-created-screen');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? 'Erro desconhecido');
    } catch (e) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    } finally {
      setState(() => _isLoading = false);
    }
    return null;
  }

  Future<UserCredential?> _submitFacebook() async {
    setState(() => _isLoading = true);

    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: ['email']);

    // ignore: unrelated_type_equality_checks
    if (loginResult == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/account-created-screen');

      _userData = userData;
    } else {
      // ignore: avoid_print
      print(loginResult.message);
    }

    setState(() {
      welcome = _userData!['email'];
    });

    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Ocorreu um erro'),
              content: Text(msg),
              actions: [
                TextButton(
                    onPressed: (() => Navigator.of(context).pop()),
                    child: const Text('Fechar'))
              ],
            ));
  }

  String nome = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final name = Provider.of<Information1>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xFFDDE9DD)),
        ),
        Container(
          color: Color(0xFFDDE9DD),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                 // Nome:
Padding(
  padding: EdgeInsets.only(top: screenHeight * 22 / 800),
  child: SizedBox(
    width: screenWidth * 328 / 360,
    height: screenHeight * 70 / 800,
    child: TextFormField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Nome',
        labelStyle: TextStyle(fontWeight: FontWeight.w800),
        hintText: 'Ex: Vera Lucia',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.name,
      onSaved: (rec) => name.nome = rec ?? 'teste',
    ),
  ),
),

// E-mail:
SizedBox(
  width: screenWidth * 328 / 360,
  height: screenHeight * 70 / 800,
  child: TextFormField(
    decoration: const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: 'E-mail',
      labelStyle: TextStyle(fontWeight: FontWeight.w800),
      hintText: 'Ex: joao@gmail.com',
      border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.emailAddress,
    onSaved: (email) => _authData['email'] = email ?? '',
    validator: (_email) {
      final email = _email ?? '';
      if (email.trim().isEmpty || !email.contains('@')) {
        return 'Informe um e-mail válido';
      }
      return null;
    },
  ),
),

// Senha:
SizedBox(
  width: screenWidth * 328 / 360,
  height: screenHeight * 70 / 800,
  child: TextFormField(
    controller: _passwordController,
    obscureText: true,
    decoration: const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: 'Senha',
      labelStyle: TextStyle(fontWeight: FontWeight.w800),
      hintText: 'Ex: senha123',
      border: OutlineInputBorder(),
    ),
    validator: (_password) {
      final password = _password ?? '';
      if (password.isEmpty || password.length < 5) {
        return 'Informe uma senha válida';
      }
      return null;
    },
    onSaved: (password) => _authData['password'] = password ?? '',
  ),
),

                  if (_isSignup())
                    SizedBox(
                       width: screenWidth * 328 / 360,
    height: screenHeight * 70 / 800,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true ,
                          fillColor: Colors.white,
                          labelText: 'Confirmar Senha',
                          labelStyle: TextStyle(fontWeight: FontWeight.w800),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        //  onSaved: (password) => _authData['password'] = password ??'',
                        validator: _isLogin()
                            ? null
                            // ignore: no_leading_underscores_for_local_identifiers
                            : (_password) {
                                final password = _password ?? '';
                                if (password != _passwordController.text) {
                                  return 'Senhas informadas não conferem.';
                                }
                                return null;
                              },
                      ),
                    ),
                  // Container(
                  //   height: screenHeight * 29 / 800,
                  //   color: Color(0xFFDDE9DD),
                  // ),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    SizedBox(
                      height: screenHeight * 50 / 800,
                      width: screenWidth * 328 / 360,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFACC9B8)),
                          onPressed: _submit,
                          child: Text(
                            _authMode == AuthMode.login
                                ? 'Entrar'
                                : 'REGISTRAR',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 130 / 800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 20 / 800),
                          width: screenWidth * 155 / 360,
                          height: screenHeight * 50 / 800,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: _submitGoogle,
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
                                    'Google',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: screenWidth * 29 / 360,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 20 / 800),
                          width: screenWidth * 155 / 360,
                          height: screenHeight * 50 / 800,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: _submitFacebook,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: screenWidth * 6 / 360),
                                    child: Image.asset(
                                        'assets/images/facebook.png'),
                                  ),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
