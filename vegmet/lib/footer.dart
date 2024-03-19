import 'package:flutter/material.dart';
import 'package:vegmet/detail.dart';
import 'package:vegmet/post_order.dart';

import 'homeGlobal.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar( // フッター部分のウィジェット
        color: Colors.lightGreen.shade300, // フッターの背景色
        child: Row( // フッター内のコンテンツを横並びに配置
          mainAxisAlignment: MainAxisAlignment.spaceAround, // コンテンツを等間隔で配置
          children: <Widget>[
            IconButton( 
              icon: const Icon(Icons.home),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
              },
            ),
            IconButton( 
              icon: const Icon(Icons.language),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeGlobal()),
                );
              },
            ),
            IconButton( 
              icon: const Icon(Icons.kitchen),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostOrder()),);
              },
            ),
            IconButton( 
              icon: const Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
                Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(0, ['https://cdn.pixabay.com/photo/2014/05/18/11/25/pizza-346985_1280.jpg'], ['tasty soup'], ['tomato,cucumber,eggplant'], ['salt, pepper, and so on. veggie veggie bbbbbbbbbbbbbbbbbbbbbbbb. '])),);
              },
            ),
          ],
        ),
    );
  }
}
