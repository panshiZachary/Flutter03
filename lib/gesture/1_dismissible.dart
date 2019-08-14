import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  List<String> items = List.generate(20, (index) => '$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
                onDismissed: (_) {
                  print('onDismissed');
                },
                key: Key(item),
                child: ListTile(
                  title: Text('$item'),
                ),
              background: Container(
                color: Color(0xffff0000),
              ),
            );
          }),
    );
  }
}
