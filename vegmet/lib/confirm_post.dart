import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'footer.dart';


class ConfirmPost extends StatelessWidget {
  late Future<List<dynamic>> futureData;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/home'));
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      print('name -> ${responseData[0]['name']}');
      return responseData;
    } else {
      print('False');
      throw Exception('Failed to load data');
    }
  }

  final String inputName;
  final String selectedItem;
  final String selectedItem2;
  final String selectedItem3;
  final String selectedMainOrSide;
  final String selectedHotOrCold;
  final String createdDescription;

  ConfirmPost(
    this.inputName,
    this.selectedItem,
    this.selectedItem2,
    this.selectedItem3,
    this.selectedMainOrSide,
    this.selectedHotOrCold,
    this.createdDescription,
  );

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

    final String sendData = selectedItem + ',' + selectedItem2 + ',' + selectedItem3 + ',' + selectedMainOrSide + ',' + selectedHotOrCold;

    Future<void> postData(String sendData) async {
      Response response = await Dio().post(
        // 'https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/home',
        'https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/order',
        data: {
          'ingredients': sendData,
        },
      );
      print(response.data);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        centerTitle: true,
        title: Text(
          '$inputName',
          style: TextStyle(
            fontSize: 32,
            color: Colors.orange[200],
            decoration: TextDecoration.underline,
            decorationColor: Colors.orange[600],
          ),
        ),
        automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // Ingredients
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ingredients (one person)',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 14, 105, 18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      "・ $selectedItem",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color.fromARGB(255, 14, 105, 18),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "・ $selectedItem2",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color.fromARGB(255, 14, 105, 18),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "・ $selectedItem3",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color.fromARGB(255, 14, 105, 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Recipes
              Padding(
                // 枠線間のPadding
                padding: EdgeInsets.only(top: 40),
                child: Container(
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, left: 20),
                                child: Text(
                                  'Recipe',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 14, 105, 18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wrap(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "料理のレシピにある「少々」「適量」「弱火」「中火」「強火」などの表現は人によって異なります。また、様々な条件によって調理環境も変わってくるので、従来のレシピ通りに出来上がるとは限りません。素材に火を通した時の加熱の仕組みや人間の脳と味覚の関係など科学的根拠を理解することによって、どんな料理にも応用することができるようになります。",
                                    "$createdDescription",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color.fromARGB(255, 14, 105, 18),
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // final dio = Dio();
                        // final response = await dio.post('https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/order',
                        //   data: {
                        //     'ingredients': sendData,
                        //   }
                        // );
                        // 送信ボタンが押されたときの処理
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ConfirmPost(
                        //     // 値の受け渡し
                        //   )),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          'Add to Recipes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // 送信ボタンが押されたときの処理
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ConfirmPost(
                        //     //値の受け渡し
                        //   )),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          'Throw away',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.yellow[100],
      bottomNavigationBar: const Footer(), // ここにbottomNavigationBarを配置する
    );
  }
}
