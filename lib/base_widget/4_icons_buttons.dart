import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('icon button 示例'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add),
              SizedBox(
                height: 10.0,
              ),
              IconButton(icon: Icon(Icons.error), onPressed: (){
                
              }),
              Container(
                height: 10.0,
                color: Colors.blue,
              ),
             RaisedButton(onPressed: (){},child: Text('raisedbutton'),)
            ],
          ),
        ),
      ),
    );
  }
}
