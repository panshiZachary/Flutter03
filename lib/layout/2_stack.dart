import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _index = Random().nextInt(2)%2;
        });
      },
      child: Icon(Icons.arrow_forward),),
      body: Center(
        child: IndexedStack(
          index: _index,
          alignment: Alignment(1.2, -1.2),
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.blue,
            )
          ],
        ),
//        buildPositionedStack(),

//        buildAlignmentStack(),
      ),
    );
  }

  Stack buildAlignmentStack() {
    return Stack(
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.red,
        ),
      ],
    );
  }

  Stack buildPositionedStack() {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xffff0000),
          width: 200.0,
          height: 200.0,
        ),
        Positioned(
//              top: 10.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Color(0xff0000ff),
          ),
        ),
      ],
    );
  }
}
