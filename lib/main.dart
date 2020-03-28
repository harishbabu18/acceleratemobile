import 'package:acceleratemobile/pages/Home.dart';
import 'package:acceleratemobile/pages/Intro.dart';
import 'package:acceleratemobile/pages/Login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Intro(title: 'Flutter Demo Home Page'),
        routes: <String, WidgetBuilder> {
          "login" : (BuildContext context) => new Login(),
          "dashboard" : (BuildContext context) => new Home(),
        }
    );
  }
}
