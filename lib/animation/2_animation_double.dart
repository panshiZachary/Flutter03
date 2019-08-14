import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _doubleAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
    _doubleAnim = ColorTween(begin: Colors.red, end: Colors.white)
        .animate(_animationController)..addListener((){
          setState(() {

          });
    })..addStatusListener((status){
       if(status== AnimationStatus.completed){
         _animationController.reverse();
       }else if(status == AnimationStatus.dismissed){
         _animationController.forward();
       }
    });
    _animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: _doubleAnim.value,
          child: FlutterLogo(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: null),
    );
  }
}
