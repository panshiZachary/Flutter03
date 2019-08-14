import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoAlertDialog(
          title: Text('标题'),
          content: Text('内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容'),
          actions: <Widget>[
            CupertinoDialogAction(child: Text('确定')),
            CupertinoDialogAction(child: Text('取消')),
          ],
        ),
      ),
    );
  }
}
