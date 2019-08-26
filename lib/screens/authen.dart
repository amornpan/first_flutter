import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Explicit
  Color greenColor = Colors.green.shade900;

  //Method
  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        color: greenColor,
        size: 36.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('เข้าสู่ระบบ'),
      // ),
      //body: SafeArea(child: Text('Authentication Body')),

      body: SafeArea(child: Stack(children: <Widget>[backButton()],),)
    );
  }
}
