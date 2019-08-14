import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _username;
  String _password;

  void _login(){
    var formState = _globalKey.currentState;
    if(formState.validate()){
      formState.save();
      print('$_username === $_username');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('simple login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入你的登录用户名',
                          hintText: '请输入你的登录用户名',
                        ),
                        onSaved: (value) {
                          print('$value');
                          _username = value;
                        },
                        onFieldSubmitted: (value) {
                          print('$value');
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入你的登录密码',
                          hintText: '请输入你的登录密码',
                        ),
                        onSaved: (value) {
                          print('$value');
                          _password = value;
                        },
                        onFieldSubmitted: (value) {
                          print('$value');
                        },
                        validator: (value) {
                          return value.length < 6 ? '密码不能小于6位' : null;
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 400.0,
                        height: 40.0,
                        child: RaisedButton(onPressed: (){
                          _login();
                        },
                        child: Text('登录'),),
                      ),
                    ],
                  ),
                  key: _globalKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
