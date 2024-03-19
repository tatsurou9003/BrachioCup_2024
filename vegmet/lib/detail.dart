import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'footer.dart';

class Detail extends StatelessWidget {
  late Future<List<dynamic>> futureData;

  @override
  Widget build(BuildContext context) {
    // width取得を行いレスポンシブ対応
    final mediaQueryData = MediaQuery.of(context);
    final width = mediaQueryData.size.width;
    double paddingValue = 1000.0;
    if (width <= 600) {
      paddingValue = 400;
    } else if (width <= 750) {
      paddingValue = 550;
    } else if (width <= 1050) {
      paddingValue = 700;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 画像
                Container(
                  width: paddingValue,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      '../images/salad.jpg', // 画像のパスを指定してください
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // タイトルとLikeの画像
                Container(
                  width: paddingValue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'トマトサラダ',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.orange[200],
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange[600],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Likeのボタンが押されたときの処理
                        },
                        icon: Image.asset(
                          '../images/like.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // 枠線1
                Container(
                  width: paddingValue,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          '材料 (一人分)',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 14, 105, 18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20),
                        child: Text(
                          "・ トマト",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 14, 105, 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20),
                        child: Text(
                          "・ バジル",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 14, 105, 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20),
                        child: Text(
                          "・ 玉ねぎ",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 14, 105, 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // 枠線2
                Container(
                  width: paddingValue,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'レシピ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 14, 105, 18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "料理のレシピにある「少々」「適量」「弱火」「中火」「強火」などの表現は人によって異なります。また、様々な条件によって調理環境も変わってくるので、従来のレシピ通りに出来上がるとは限りません。素材に火を通した時の加熱の仕組みや人間の脳と味覚の関係など科学的根拠を理解することによって、どんな料理にも応用することができるようになります。",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 14, 105, 18),
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.yellow[100],
      bottomNavigationBar: const Footer(),
    );
  }
}
