import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit
  Color greenColor = Colors.green.shade600;
  Color blueColor = Colors.blue.shade600;
  Color pinkColor = Colors.pink.shade600;

  //Method

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: greenColor,
          ),
          labelText: 'Name : ', labelStyle: TextStyle(color: greenColor),
          helperText: 'Type Your Name', helperStyle: TextStyle(color: greenColor),
          hintText: 'English Only'),
    );
  }

  Widget emailText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: blueColor,
          ),
          labelText: 'Email : ', labelStyle: TextStyle(color: blueColor),
          helperText: 'Type Your Email', helperStyle: TextStyle(color: blueColor),
          hintText: 'English Only'),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: pinkColor,
          ),
          labelText: 'Password : ', labelStyle: TextStyle(color: pinkColor),
          helperText: 'Type Your Password', helperStyle: TextStyle(color: pinkColor),
          hintText: 'More 6 Charactor'),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0xFF, 0x43, 0xa0, 0x47),
        title: Text('ลงทะเบียน'),
        actions: <Widget>[registerButton()],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 70.0),
        children: <Widget>[
          nameText(),
          emailText(),
          passwordText(),
        ],
      ),
    );
  }
}
