import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit
  String loginString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//Method

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      loginString = firebaseUser.displayName;
      print('Loigin User = $loginString');
    });
  }

  Widget showLogin() {
    return Text(
      'Login by ... $loginString',
      style: TextStyle(fontSize: 12.0),
    );
  }

  Widget showAppName() {
    return Text(
      'First Flutter App',
      style: TextStyle(
          fontSize: 24.0, fontFamily: 'DancingScript', color: Colors.white),
    );
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 70.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          myHeadDrawer(),
        ],
      ),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mountains.jpg'), fit: BoxFit.fill)),
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('Body'),
      drawer: myDrawerMenu(),
    );
  }
}
