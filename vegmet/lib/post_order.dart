import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vegmet/confirm_post.dart';

import 'package:dio/dio.dart';

import 'footer.dart';

void main() {
  runApp(MaterialApp(
    title: 'Main Vegetable Selection',
    initialRoute: '/', // 初期ルートを指定
    theme: ThemeData(fontFamily: "NotoSansJP"),
    routes: {
      '/post_order': (context) => PostOrder(), // PostOrder画面
    },
  ));
}


class PostOrder extends StatefulWidget {
    const PostOrder({Key? key}) : super(key: key); // コンストラクタで key を指定

    @override
    _PostOrderState createState() => _PostOrderState();
}

class _PostOrderState extends State<PostOrder> {
  bool _isLoading = false;
  TextEditingController _controller = TextEditingController();

  String? _inputName;
  String? _selectedItem;
  String? _selectedItem2;
  String? _selectedItem3;
  String? _selectedMainOrSide;
  String? _selectedHotOrCold;

  final List<String> itemList = ['トマト', 'キュウリ', 'ナス', 'カボチャ', 'キャベツ', 'ニンジン', 'ジャガイモ', 'レタス'];

  Future<void> postDataAndChangeScreen(String _selectedItem, String _selectedItem2, String _selectedItem3, String _selectedMainOrSide, String _selectedHotOrCold) async {
    setState(() {
      _isLoading = true;
    });
    String _createdDescription;
    final String sendData = _selectedItem + ',' + _selectedItem2 + ',' + _selectedItem3 + ',' + _selectedMainOrSide + ',' + _selectedHotOrCold;
    try{
      Response response = await Dio().post(
        // 'https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/home',
        'https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/order',
        data: {
          "ingredients": sendData,
        },
      );
      print(sendData);
      print(response.data['content'][0]['text']);

      _createdDescription = response.data['content'][0]['text'];

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfirmPost(
          _inputName ?? '',
          _selectedItem ?? '',
          _selectedItem2 ?? '',
          _selectedItem3 ?? '',
          _selectedMainOrSide ?? '',
          _selectedHotOrCold ?? '',
          _createdDescription ?? '')),
      );
    } on DioError catch(e) {
      debugPrint('Request failed : $e');
    } finally {
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query
    final mediaQueryData = MediaQuery.of(context);
    final width = mediaQueryData.size.width;
    double paddingValue = 1000.0;
    if(width <= 600){
      paddingValue = 400;
    }else if(width <= 750){
      paddingValue = 550;
    }else if(width <= 1050){
      paddingValue = 700;
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        toolbarHeight: 80.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              // color: Colors.white,
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _inputName = value;
                  });
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'レシピ名を入力してください',
                  fillColor: Colors.green,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  //ボタンを押したときの処理
                },
                icon: Image.asset(
                  '../images/vegmet.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),

      body: 
        Padding(
        padding: const EdgeInsets.only(bottom: 50.0), 
        child: Center(
        child: Container(
          width: paddingValue,
          height: 500,
          // 枠線のスタイリング
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
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10,left: 100),
                    child: Text('メインの野菜',
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
            
            // Main Vegetable1
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100), 
              child: DropdownButton(
              style: TextStyle(
                color: Colors.orange,
              ),
              value: _selectedItem, 
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedItem = newValue; 
                  });}
              },
              items: itemList.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),),

            // Main Vegetable2
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100), 
              child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.orange,
              ),
              value: _selectedItem2, 
              onChanged: (String? newValue) {
                if (newValue != null) {
                setState(() {
                  _selectedItem2 = newValue; 
                });}
              },
              items: itemList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            ),

            // Main Vegetable3
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100), 
              child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.orange,
              ),
              value: _selectedItem3, 
              onChanged: (String? newValue) {
                if (newValue != null) {
                setState(() {
                  _selectedItem3 = newValue; 
                });}
              },
              items: itemList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20,left: 100),
                  child:Text(
                    '主菜？副菜？',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), 
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.orange,
              ),
              value: _selectedMainOrSide, 
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedMainOrSide = newValue; 
                  });}
              },
              items: <String>['主菜', '副菜']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20,left: 100),
                  child:Text(
                    '温かい？冷たい？',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), 
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: DropdownButton<String>(
              style: TextStyle(
                color: Colors.orange,
              ),
              value: _selectedHotOrCold, 
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedHotOrCold = newValue; 
                  });}
              },
              items: <String>['温かい', '冷たい']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            ),
            

            Padding(
              padding: const EdgeInsets.only(top: 40.0), 
              child: Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    // if((_selectedItem != null) && (_selectedItem2 != null) && ((_selectedItem3 != null)))
                    // postDataAndChangeScreen(_selectedItem, _selectedItem2, _selectedItem3, _selectedMainOrSide, _selectedHotOrCold);
                    postDataAndChangeScreen(
                        _selectedItem ?? '',
                        _selectedItem2 ?? '',
                        _selectedItem3 ?? '',
                        _selectedMainOrSide ?? '',
                        _selectedHotOrCold ?? ''
                    );
                    // 送信ボタンが押されたときの処理
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                child: Padding( 
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Post Order',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 18.0,
                     ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
        ),
      ),
      backgroundColor: Colors.yellow[100],

      // フッター
      bottomNavigationBar: const Footer(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}