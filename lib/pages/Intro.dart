import 'dart:async';

import 'package:flutter/material.dart';



class Intro extends StatefulWidget {
  Intro({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  @override
  void initState() {
    super.initState();

    Timer.run(() {
      Navigator.of(context).pushNamed("login");
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Center(child: Text("Welcome") ,),),
    );
  }

}