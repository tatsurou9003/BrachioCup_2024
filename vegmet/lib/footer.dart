import 'package:flutter/material.dart';

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
              },
            ),
            IconButton( 
              icon: const Icon(Icons.kitchen),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
              },
            ),
            IconButton( 
              icon: const Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
                // ボタンが押されたときの処理
              },
            ),
          ],
        ),
    );
  }
}