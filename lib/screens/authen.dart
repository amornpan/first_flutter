import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/screens/my_service.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Explicit
  Color greenColor = Colors.green.shade900;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String email = '', password = '';

  final fromKey = GlobalKey<FormState>();

  //Method
  Widget LoginButton() {
    return FloatingActionButton(
      backgroundColor: greenColor,
      child: Icon(
        Icons.navigate_next,
        size: 36.0,
      ),
      onPressed: () {
        fromKey.currentState.save();
        print('email=$email, password=$password');
        checkAuthen();
      },
    );
  }

  Future<void> checkAuthen() async {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: showTitle(title),
          content: Text(message),
          actions: <Widget>[okButton()],
        );
      },
    );
  }

  Widget okButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showTitle(String title) {
    return ListTile(
      leading: Icon(
        Icons.add_alert,
        color: Colors.red,
        size: 48.0,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: greenColor,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: greenColor),
      ),
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: greenColor,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: greenColor),
      ),
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget showName() {
    return ListTile(
      leading: ImageIcon(
        AssetImage('images/logo.png'),
        size: 36.0,
        color: greenColor,
      ),
      title: Text(
        'Sign In:',
        style: TextStyle(
            fontSize: 25.0, color: greenColor, fontFamily: 'DancingScript'),
      ),
    );
  }

  Widget showAuthen() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bicycle_wallpaper.jpg'),
              fit: BoxFit.fill)),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(50.0),
        color: Color.fromRGBO(255, 255, 255, 0.5),
        width: 400.0,
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showName(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        color: greenColor,
        size: 36.0,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('เข้าสู่ระบบ'),
      // ),
      //body: SafeArea(child: Text('Authentication Body')),

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            showAuthen(),
            backButton(),
          ],
        ),
      ),
      floatingActionButton: LoginButton(),
    );
  }
}
