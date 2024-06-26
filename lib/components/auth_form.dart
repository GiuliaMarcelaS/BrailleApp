import 'package:braille_app/exceptions/auth_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';

enum AuthMode{signup, login}

class AuthForm extends StatefulWidget {
  final double screenHeight;
  const AuthForm({
    super.key,
    this.screenHeight = 0,
    });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData ={
    'email': '',
    'password': '',
  };
  
  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid){
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try{
    if(_isLogin()){
      await auth.login(_authData['email']!, _authData['password']!,);
    }else{
      await auth.signup(_authData['email']!, _authData['password']!,);
    }
    Navigator.of(context).pushNamed('/interface-screen');
    } on AuthException catch (error){
        _showErrorDialog(error.toString());
    } catch(error){
      _showErrorDialog('Ocorreu um erro inesperado!');
    }
    
    setState(() => _isLoading = false);
    
  }

  void _switchAuthMode(){
    setState(() {
      if(_isLogin()){
        _authMode = AuthMode.signup;
      } else{
        _authMode = AuthMode.login;
      }
    });
  }

  void _showErrorDialog(String msg){
    showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: const Text('Ocorreu um erro'),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: (() => Navigator.of(context).pop()),
           child: const Text('Fechar'))
      ],
    ));
  }

  void _interface(BuildContext context){
    Navigator.of(context).pushNamed('/interface-screen');
  }

  void _forgotPassword(BuildContext context) {
    Navigator.of(context).pushNamed('/forgot-password-screen');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Color(0xFFDDE9DD)),),
          Container(
            color: Color(0xFFDDE9DD),
            child: Form(
            key: _formKey,
            child:Column(children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight*22/800),
                width: screenWidth*328/360,
                height: screenHeight*70/800,
                color: Colors.white,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(fontWeight: FontWeight.w800),
                    hintText: 'Ex: joao@gmail.com',
                    border: OutlineInputBorder(),
                    ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) => _authData['email'] = email ??'',
                  // ignore: no_leading_underscores_for_local_identifiers
                  validator: (_email) {
                    final email = _email ?? '';
                    if (email.trim().isEmpty|| !email.contains('@')){
                      return 'Informe um e-mail válido';
                      }
                      return null;
                    },
                ),
              ),
              Container(
                height: screenHeight*70/800,
                margin: EdgeInsets.only(top:screenHeight*28/800),
                width: screenWidth*328/360,
                color: Colors.white,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(fontWeight: FontWeight.w800), 
                    hintText: 'Ex: senha123',
                    border: OutlineInputBorder(),
                    ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: _passwordController,
                  onSaved: (password) => _authData['password'] = password ??'',
                  // ignore: no_leading_underscores_for_local_identifiers, body_might_complete_normally_nullable
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.isEmpty||password.length < 5){
                      return 'Informe uma senha válida';
                    }
                  },
                ),
              ),
              if(_isSignup())
               TextFormField(
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
               // onSaved: (password) => _authData['password'] = password ??'',
                validator: _isLogin() ? null
                // ignore: no_leading_underscores_for_local_identifiers
                :(_password) {
                  final password = _password ?? '';
                  if(password != _passwordController.text){
                    return 'Senhas informadas não conferem.';
                  }
                  return null;
                },
              ),
              Container(
                width: screenWidth*300/360,
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: (){_forgotPassword(context);},
                  child: Text('Esqueceu sua senha?',
                  style: TextStyle(color: Color(0xFF1CB9C5)),),
                ),
              ),
             Container(height: screenHeight*29/800, color: Color(0xFFDDE9DD), ),
              if(_isLoading)
              const CircularProgressIndicator()
              else
              Container(
                height: screenHeight*50/800,
                width: screenWidth*328/360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFACC9B8)),
                  onPressed: _submit, 
                  child: Text(
                    _authMode == AuthMode.login? 'Entrar': 'REGISTRAR',
                    style: TextStyle(color: Colors.white),
                  )),
              ),
              
            ],) ),
          )],
      ),
    );
  }
}