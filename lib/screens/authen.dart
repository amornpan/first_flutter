import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Explicit
  Color greenColor = Colors.green.shade900;

  //Method
  Widget emailText() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: greenColor,
          ),
          labelText: 'Email :',
          labelStyle: TextStyle(color: greenColor)),
    );
  }

  Widget passwordText() {
    return TextField(obscureText: true,
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: greenColor,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: greenColor)),
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
    ));
  }
}
