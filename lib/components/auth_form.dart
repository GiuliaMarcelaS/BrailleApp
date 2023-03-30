import 'package:braille_app/exceptions/auth_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/auth.dart';
import 'package:braille_app/exceptions/auth_exception.dart';

enum AuthMode{Signup, Login}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData ={
    'email': '',
    'password': '',
  };

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

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
    }} on AuthException catch (error){
        _showErrorDialog(error.toString());
    } catch(error){
      _showErrorDialog('Ocorreu um erro inesperado!');
    }
    
    setState(() => _isLoading = false);
  }

  void _switchAuthMode(){
    setState(() {
      if(_isLogin()){
        _authMode = AuthMode.Signup;
      } else{
        _authMode = AuthMode.Login;
      }
    });
  }

  void _showErrorDialog(String msg){
    showDialog(context: context, builder: (ctx)=> AlertDialog(
      title: Text('Ocorreu um erro'),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: (() => Navigator.of(context).pop()),
           child: Text('Fechar'))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Form(
          key: _formKey,
          child:Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (email) => _authData['email'] = email ??'',
              validator: (_email) {
                final email = _email ?? '';
                if (email.trim().isEmpty|| !email.contains('@')){
                  return 'Informe um e-mail válido';
                  }
                  return null;
                },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Senha'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              controller: _passwordController,
              onSaved: (password) => _authData['password'] = password ??'',
              validator: (_password) {
                final password = _password ?? '';
                if (password.isEmpty||password.length < 5){
                  return 'Informe uma senha válida';
                }
              },
            ),
            if(_isSignup())
             TextFormField(
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
             // onSaved: (password) => _authData['password'] = password ??'',
              validator: _isLogin() ? null
              :(_password) {
                final password = _password ?? '';
                if(password != _passwordController.text){
                  return 'Senhas informadas não conferem.';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            if(_isLoading)
            CircularProgressIndicator()
            else
            ElevatedButton(
              onPressed: _submit, 
              child: Text(
                _authMode == AuthMode.Login? 'ENTRAR': 'REGISTRAR',
              )),
              //Spacer(),
              TextButton(
                onPressed: _switchAuthMode, 
                child: Text(
                  _isLogin() ? 'REGISTRAR': 'JÁ POSSUI CONTA?'
                ))
          ],) ),
      ),
    );
  }
}