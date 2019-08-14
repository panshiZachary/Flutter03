import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'loading',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            SizedBox(height: 20.0,),
            CupertinoActivityIndicator(
              radius: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

