import 'package:flutter/material.dart';
import 'package:async/async.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material app',
      routes: {'/other': (BuildContext context) => Other()},
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _widgetOptions = [
    Text('消息'),
    Text('通讯录'),
    Text('发现'),
    Text('我'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App 示例'),
      ),
      body: _widgetOptions.elementAt(_currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/other');
        },
        tooltip: '路由跳转',
        backgroundColor: Color(0xff000000),
        foregroundColor: Color(0xffffffff),
        elevation: 0.0,
        child: Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), title: Text('发现')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('我')),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('http://www.adyun.com/zh-cn/images/ssp.png'),
              ),
              accountName: Text('Zachary'),
              accountEmail: Text('834959743@qq.com'),
              otherAccountsPictures: <Widget>[Icon(Icons.camera_alt)],
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/wxg.png'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员特权'),
            ),
            AboutListTile(
              icon: Icon(Icons.error),
              child: Text('关于'),
              applicationName: '浙江盘石',
              applicationVersion: 'v 1.0',
            )
          ],
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('other 页面'),
        ),
      ),
    );
  }
}
