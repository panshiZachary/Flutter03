import 'package:flutter/material.dart';

GlobalKey<MyAppState> rootKey = GlobalKey<MyAppState>();

void main() => runApp(MyApp(key: rootKey));

class MyApp extends StatefulWidget {
  MyApp({Key key}):super(key:key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String errorMessage;

  handleError(String error) {
    if (mounted) {
      setState(() {
        errorMessage = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return errorMessage == null
        ? MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          )
        : ErrorWidget(errorMessage);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      rootKey.currentState.handleError('error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          backgroundColor: Colors.white,
          child: CustomPaint(
            child: Container(),
            painter: FloatingPainter(),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FloatingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var amberPaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 5.0;
    var greenPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5.0;
    var bluePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0;
    var redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0;

    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.25, size.height * 0.5), amberPaint);

    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.75), greenPaint);

    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.75, size.height * 0.5), bluePaint);

    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.5),
        Offset(size.width * 0.5, size.height * 0.25), redPaint);
  }

  @override
  bool shouldRepaint(FloatingPainter oldDelegate) {
    return false;
  }
}
