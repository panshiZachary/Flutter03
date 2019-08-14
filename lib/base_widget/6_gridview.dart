import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('gridview 示例'),
          ),
          body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
                return Container(
                  color: Color(0xff00ff00),
                  margin: EdgeInsets.all(10.0),
                  child: Text('$index',style: TextStyle(
                    fontSize: 20.0
                  ),),
                );
              })
//        GridView.count(
//          crossAxisCount: 2, // 交叉轴
//          scrollDirection: Axis.horizontal, // 水平方向滚动
//          childAspectRatio: 3 / 4, // 宽高比
//          children: List.generate(100, (index) {
//            return Container(
//              color: Color(0xffff0000),
//              margin: EdgeInsets.all(10.0),
//              child: Text(
//                '$index',
//                style: TextStyle(fontSize: 20.0),
//              ),
//            );
//          }),
//        ),
          ),
    );
  }
}
