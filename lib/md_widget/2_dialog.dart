import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            SimpleDialog(
              title: Text('对话框标题'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    print('选项1');
                  },
                  child: Text('选项1'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    print('选项1');
                  },
                  child: Text('选项1'),
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('提示'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('是否删除？'),
                                  Text('删除后不可恢复！')
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('确定')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('取消')),
                            ],
                          );
                        });
                  },
                  child: Text('删除'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
