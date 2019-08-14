import 'package:flutter/material.dart';

void main() => (MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;
  String _animValue;

  // 四种状态
  // 1. dismissed 初始状态
  // 2. forward 从头到尾播放状态
  // 3. reverse 从尾到头播放状态
  // 4. complete 完成状态

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _doubleAnim = Tween(begin: 0.0,end: 1.0).animate(_animationController)..addListener((){
      print(_doubleAnim.value.toString());
      _animValue = _doubleAnim.value.toString();
    })..addStatusListener((status){
      print(status);
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
        child: Text('$_animValue'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
