import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/screens/my_service.dart';
import 'package:first_flutter/screens/register.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Method

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  Widget mySizebox() {
    return SizedBox(
      width: 10.0,
      height: 15.0,
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text('Sign Up', style: TextStyle(color: Colors.blue.shade700)),
        onPressed: () {
          print('You Click SignUp Button');
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.blue.shade400,
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget showButton() {
    //return Container( color: Colors.grey,
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: Row(
        children: <Widget>[signInButton(), mySizebox(), signUpButton()],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200.0,
        height: 200.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      //'ระบบประเมินความพึงพอใจ',
      'Customer Satisfaction',
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
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.white, Colors.blue],
          radius: 1.2,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showAppName(),
            mySizebox(),
            showLogo(),
            mySizebox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
