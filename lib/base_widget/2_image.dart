import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('image 示例'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              // 加载网络图片
              Image.network(
                'http://www.adyun.com/zh-cn/images/wxg.png',
                width: 100.0,
                height: 100.0,
              ),
              // 加载 asset
              Image.asset(
                'assets/images/wxg.png',
                width: 150.0,
                height: 150.0,
              ),
              // Memery
              MemeryImageWidget(),
              // 从文件加载tup
              FileImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// 从文件中加载
class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File _image;
  Future getIamge() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _image == null
              ? Text('未选择图片')
              : Image.file(
                  _image,
                  width: 100.0,
                  height: 100.0,
                ),
        ),
        FlatButton(
            onPressed: getIamge,
            child: Text(
              '请选择图片',
              style: TextStyle( color: Color(0xff0000ff),),
            ))
      ],
    );
  }
}

// 从内存中加载
class MemeryImageWidget extends StatefulWidget {
  @override
  _MemeryImageWidgetState createState() => _MemeryImageWidgetState();
}

class _MemeryImageWidgetState extends State<MemeryImageWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/wxg.png').then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      image: bytes == null ? null : DecorationImage(image: MemoryImage(bytes)),
    );
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: _decoration,
    );
  }
}
