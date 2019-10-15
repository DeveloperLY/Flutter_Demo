import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'app_route.dart';
import 'login.dart';
import 'home.dart';

void main() {
  router.define('home/:data', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return new Home(params['data'][0]);
      }));
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: 'Flutter Demo Home Page',
      theme: new ThemeData(
          primaryColor: Colors.blue
      ),
      home: new LoginPage(),
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text(wordPair.asPascalCase),
//        child: new RandomWords(),
//        ),
//      ),
    );
  }
}

