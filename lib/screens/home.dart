import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit

  //Method
  Widget showLogo(){
    return Image.asset('images/logo.png');
  }

  Widget showAppName() {
    return Text('Flutter App');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
        ],
      ),
    );
  }
}
