import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit

  //Method

  Widget signInButton() {
    return Expanded(
          child: RaisedButton(
        child: Text('Sign In'),
        onPressed: () {},
      ),
    );
  }

  Widget showButton() {
    return Container( color: Colors.grey,
      margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
      child: Row(
        children: <Widget>[signInButton(), signInButton()],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 150.0,
        height: 150,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Flutter App',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.blue[700],
        fontFamily: 'DancingScript',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
          showButton(),
        ],
      ),
    );
  }
}
