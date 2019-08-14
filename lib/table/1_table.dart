import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0:FixedColumnWidth(50.0),
            1:FixedColumnWidth(100.0),
            2:FixedColumnWidth(50.0),
            3:FixedColumnWidth(50.0),

          },
          border: TableBorder.all(
            color: Color(0xffff0000),
            width: 1,
          ),
          children: const <TableRow>[
            TableRow(children: [
              Text('头像'),
              Text('姓名'),
              Text('年龄'),
              Text('身高'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('盘石'),
              Text('15'),
              Text('188'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('盘石'),
              Text('15'),
              Text('188'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('盘石'),
              Text('15'),
              Text('188'),
            ]),
            TableRow(children: [
              Icon(Icons.description),
              Text('盘石'),
              Text('15'),
              Text('188'),
            ]),
          ],
        ),
      ),
    );
  }
}
