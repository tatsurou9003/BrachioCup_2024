import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


import 'footer.dart';
import 'main.dart';
import 'detail.dart';

class HomeGlobal extends StatefulWidget {
  const HomeGlobal();

  @override
  _HomeGlobal createState() => _HomeGlobal();
}

class _HomeGlobal extends State {
  List recipeImageList = [];
  List recipeNameList = [];
  List recipeIngredientsList = [];
  List recipeDescriptionList = [];

  Future<void> fetchData() async {
    Response response = await Dio().get(
      'https://e9nrzw97x4.execute-api.ap-northeast-1.amazonaws.com/dev/vegmet/home',
    );
    print(response.data.length);
    print(recipeImageList);
    print(recipeNameList);

    for (var i=0; i<response.data.length; i++) {
      // print(i);
      // print(response.data[i]);
      // if (response.data[i]['name'] == null){
      //   response.data[i]['name'] = 'Nameless';
      // } else {
      //   recipeNameList.add(response.data[i]['name']);
      // }

      // recipeImageList.add(response.data[i]['figure'].toString());
      // recipeNameList.add(response.data[i]['name'].toString());
      // recipeIngredientsList.add(response.data[i]['ingredients'].toString());
      // recipeDescriptionList.add(response.data[i]['description'].toString());
      recipeImageList.add(response.data[i]['figure']);
      recipeNameList.add(response.data[i]['name']);
      recipeIngredientsList.add(response.data[i]['ingredients']);
      recipeDescriptionList.add(response.data[i]['description']);
      print('');
    }
    print('');
    print(recipeImageList);
    print(recipeNameList);
    print(recipeIngredientsList);
    print(recipeDescriptionList);
    setState(() {});
  }

  var userData = {
    'id' : '639c15a0-c297-23b7-45f9-6edffcafce3a',
    'username' : '佐藤三郎',
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: 
            Container(
              height: 20,
              width: 20,
              child: Image.asset('../images/vegmet.png'),
            ),
          title: Text(
            'みんなのレシピ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          actions: [
            Container(
              // alignment: Alignment.centerRight,
              // height: 30,
              // width: 30,
              child: Image.asset('../images/salad.png'),
            ),
          ],
          backgroundColor: Colors.yellow[100],
        ),
        body: Container(
          color: Colors.yellow[100],
          child: GridView.builder(
            itemCount: recipeImageList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail(index, recipeImageList, recipeNameList, recipeIngredientsList,recipeDescriptionList)),
                    // MaterialPageRoute(builder: (context) => MyHomePage(title: "Veggie Gourmet")),
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(recipeImageList[index]),
                        
                      ),
                      // Text('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      Center(
                        child: Text(
                          // strList[index],
                          recipeNameList[index],
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
            ),
            padding: const EdgeInsets.all(20),
          ),
        ),
        // body: Column(
          // children: [
            // Container(
            //   height: 80,
            //   color: Colors.lightGreen.shade200,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 30,
            //         width: 30,
            //         child: Image.asset('../images/vegmet.png'),
            //       ),
            //       Text(
            //         'Global recipes',
            //         style: TextStyle(
            //           fontStyle: FontStyle.italic,
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.orange,
            //         ),
            //       ),
            //       Container(
            //         alignment: Alignment.centerRight,
            //         height: 100,
            //         width: 100,
            //         child: Image.asset('../images/salad.png'),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 80,
            //   color: Colors.lightGreen.shade200,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: Colors.white,
            //           backgroundColor: Colors.lightGreen,
            //           side: BorderSide(color: Colors.lightGreen, width: 2),
            //         ),
            //         child: const Text('Latest')
            //       ),
            //       OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: Colors.white,
            //           backgroundColor: Colors.lightGreen,
            //           side: BorderSide(color: Colors.lightGreen, width: 2),
            //         ),
            //         child: const Text('Oldest')
            //       ),
            //       OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: Colors.white,
            //           backgroundColor: Colors.lightGreen,
            //           side: BorderSide(color: Colors.lightGreen, width: 2),
            //         ),
            //         child: const Icon(Icons.favorite)
            //       ),
            //     ],
            //   ),
            // ),
            // GridView.builder(
            //   itemCount: strList.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       color: Colors.blueAccent,
            //       child: Center(child: Text(strList[index])),
            //     );
            //   },
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            //     mainAxisSpacing: 5,
            //     crossAxisSpacing: 5,
            //     childAspectRatio: 2.0,
            //   ),
            // ),
            // Text('buttons'),
          // ],
        // ),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}