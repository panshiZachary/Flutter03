import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('listview 示例'),
      ),
      body:
          //          new NormalListView(),
//          new HorizontalWidget(),

          ListView.builder(
        itemBuilder: (context, index) {
          print('$index');
          if (index.isOdd) {
            return Divider();
          }
          return ListTile(
            leading: Icon(Icons.launch),
            title: Text('盘石互联网广告大厦$index'),
            subtitle: Text('盘石互联网广告大厦'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        itemCount: 100,
      ),
    ));
  }
}

class HorizontalWidget extends StatelessWidget {
  const HorizontalWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(100, (index) {
        return Text(
          '$index ',
          style: TextStyle(fontSize: 20.0),
        );
      }),
    );
  }
}

class NormalListView extends StatelessWidget {
  const NormalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.launch),
          title: Text('盘石互联网广告大厦'),
          subtitle: Text('盘石互联网广告大厦'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.launch),
          title: Text('盘石互联网广告大厦'),
          subtitle: Text('盘石互联网广告大厦'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.launch),
          title: Text('盘石互联网广告大厦'),
          subtitle: Text('盘石互联网广告大厦'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.launch),
          title: Text('盘石互联网广告大厦'),
          subtitle: Text('盘石互联网广告大厦'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
