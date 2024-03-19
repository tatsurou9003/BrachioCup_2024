import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart';

import 'footer.dart';

void main() {
  runApp(const MyApp());
  // runApp(const TopPage());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    print('called initState');
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        color: Colors.lightGreen,
        builder: Authenticator.builder(),
        home: MyHomePage(title: "Veggie Gourmet")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
      bottomNavigationBar: const Footer(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Text(
                //   'Veggie Gourmet',
                //   style: TextStyle(
                //     fontStyle: FontStyle.italic,
                //     fontSize: 35,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('../images/vegmet.png'),
                ),
                // Container(
                //   width: 280,
                //   height: 80,
                //   child: OutlinedButton(
                //     onPressed: (){
                //       // ボタンが押されたときの処理をここに書く
                //       print('ボタンがタップされました。');
                //       // Navigator.push(
                //       //   context,
                //       //   MaterialPageRoute(builder: (context) => const)
                //       // );
                //     },
                //     child: Text(
                //       'Enjoy your meals',
                //       style: TextStyle(
                //         fontStyle: FontStyle.italic,
                //         fontSize: 25,
                //       ),
                //     ),
                //     style: OutlinedButton.styleFrom(
                //       foregroundColor: Colors.white,
                //       backgroundColor: Colors.orange,
                //       side: BorderSide(color: Colors.orange, width: 2),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // bottomNavigationBar: const Footer(),
        ),
      ),
    );
  }
}
