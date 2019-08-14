import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align 示例'),
        ),
        body: Center(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Color(0xffff0000),
            ),
          ),
        ),
      ),
    );
  }
}
