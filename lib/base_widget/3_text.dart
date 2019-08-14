import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('text 示例'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'rockysaas致力于通过大数据和人工智能全面赋能企业智慧经营',
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // 。。。
                softWrap: true, //自动换行
                style: TextStyle(
                    fontSize: 30.0,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.wavy),
              ),
              SizedBox(
                height: 20.0,
              ),
              RichText(
                  text: TextSpan(
                text: '致力于通过大数据和人工智能，',
                style: TextStyle(color: Color(0xffff0000), fontSize: 20.0),
                children: <TextSpan>[
                  TextSpan(text: '全面赋能企业智慧经营，'),
                  TextSpan(
                      text: 'rockysaas',
                      style: TextStyle(
                        color: Color(0xff0000ff),
                      ),
                      recognizer: TapGestureRecognizer()..onTap =() async {
                        String url = 'http://rockysaas.com/';
                        if(await canLaunch(url)){
                          launch(url);
                        }else{
                          throw 'error :$url';
                        }

                      })
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
