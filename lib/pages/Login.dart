import 'dart:async';
import 'dart:convert';
import 'package:acceleratemobile/model/Loginbody.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String status="";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


Future<Loginbody> loginSubmit(String url, {Map body}) async {


  Response response;
  Dio dio = new Dio();
  response = await dio.post("http://in.api.teraret.com/api/login", data: jsonEncode(body));

  String currentStatus="";
  if(response.statusCode >= 200 ){
    currentStatus=response.data.toString();
    Timer.run(() {
      Navigator.of(context).pushNamed("dashboard");
    });

  }else {

    currentStatus="Wrong Password";
  }

  this.setState((){
    status =currentStatus;
  });
  //print(response.data.toString());
}
void login(){
  Loginbody userlogin = new Loginbody(username:emailController.text,password:passwordController.text);
  loginSubmit("http://in.api.teraret.com/api/login",body:userlogin.toMap());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              margin:EdgeInsets.all(20),
              child: TextFormField(
                controller: emailController,
              decoration: InputDecoration(
              hintText: "E-Mail",
               border: OutlineInputBorder(),
              ),
            ),
            ), Container(
              margin:EdgeInsets.all(20),
              child:PasswordField(
//                color: Colors.blue,
               controller: passwordController,
                hasFloatingPlaceholder: true,
                pattern: r'.*[@$#.*].*',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: BorderSide(width: 2,
                        //color: Colors.blue
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2,
                        //color: Colors.blue
                    )
                ),
                errorMessage: 'must contain special character either . * @ # \$',
            ), ),


              Container(
                margin:EdgeInsets.all(20),
                child:ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child:RaisedButton(child: Text('Login'),onPressed: login,color: Colors.amber,)
                ),)
              ,
              Container(child: Text(status),)
            ]
        ),
      ),
    );
  }

}