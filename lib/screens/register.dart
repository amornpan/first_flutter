import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit
  Color greenColor = Colors.green.shade600;
  Color blueColor = Colors.blue.shade600;
  Color pinkColor = Colors.pink.shade300;

  final formKey = GlobalKey<FormState>();

  String nameString, emailString, passwordString;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Method
  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: greenColor,
          ),
          labelText: 'Name : ',
          labelStyle: TextStyle(color: greenColor),
          helperText: 'Type Your Name',
          helperStyle: TextStyle(color: greenColor),
          hintText: 'English Only'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: blueColor,
          ),
          labelText: 'Email : ',
          labelStyle: TextStyle(color: blueColor),
          helperText: 'Type Your Email',
          helperStyle: TextStyle(color: blueColor),
          hintText: 'you@email.com'),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Valid Email-Address Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
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
          labelText: 'Password : ',
          labelStyle: TextStyle(color: pinkColor),
          helperText: 'Type Your Password',
          helperStyle: TextStyle(color: pinkColor),
          hintText: 'More 6 Charactor'),
      validator: (String value) {
        if (value.length < 6) {
          return 'Password must more than 6 character';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
          registerThread();
        }
      },
    );
  }

  Future<void> registerThread() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
          print('Success Register');
        })
        .catchError((response) {
          print('response value = ${response.toString()}');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0xFF, 0x43, 0xa0, 0x47),
        title: Text('ลงทะเบียน'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 70.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
