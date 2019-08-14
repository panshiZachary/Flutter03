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
  Animation<double> _doubleAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
    _doubleAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyLogo(animation: _doubleAnim),
      ),
    );
  }
}

class MyLogo extends AnimatedWidget {
  final Tween<double> _rotateAnim = Tween(begin: 0.0, end: 20.0);
  final Tween<double> _scaleAnim = Tween(begin: 1.0, end: 10.0);

  MyLogo({Key key, @required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: _scaleAnim.evaluate(animation),
      child: Transform.rotate(
        angle: _rotateAnim.evaluate(animation),
        child: Container(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
