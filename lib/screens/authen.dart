import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Explicit
  Color greenColor = Colors.green.shade900;

  //Method
  Widget showName() {
    return ListTile(
      leading: ImageIcon(
        AssetImage('images/logo.png'),
        size: 36.0,
        color: greenColor,
      ),
      title: Text(
        'Amornpan Phornchaicharoen',
        style: TextStyle(
            fontSize: 30.0, color: greenColor, fontFamily: 'DancingScript'),
      ),
    );
  }

  Widget showAuthen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[showName()],
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
          backButton(),
          showAuthen(),
        ],
      ),
    ));
  }
}
