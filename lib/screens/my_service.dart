import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/screens/home.dart';
import 'package:first_flutter/screens/list_product.dart';
import 'package:first_flutter/screens/show_map.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit
  String loginString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  double mySizeIcon = 36.0;
  double h2 = 18.0;
  Widget myWidget = ListProduct();
  Widget myMap = ShowMap();

//Method

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> scanQRcode()async{
    try {
      String barCode = await BarcodeScanner.scan();
      print('barcode $barCode');
    } catch (e) {
    }
  }

  Widget listProductMenu() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: mySizeIcon,
      ),
      title: Text(
        'List Products',
        style: TextStyle(fontSize: h2),
      ),
      subtitle: Text('Show List All of Product'),
      onTap: (() {
        setState(() {
          myWidget = ListProduct();
          Navigator.of(context).pop();
        });
      }),
    );
  }

  Widget mapMenu() {
    return ListTile(
      leading: Icon(
        Icons.map,
        size: mySizeIcon,
      ),
      title: Text(
        'Show Map',
        style: TextStyle(fontSize: h2),
      ),
      subtitle: Text('Show Current Location Map'),
      onTap: (() {
        setState(() {
          myWidget = ShowMap();
          Navigator.of(context).pop();
        });
      }),
    );
  }

  Widget signOutMenu() {
    return ListTile(
      leading: Icon(
        //Icons.cached,
        Icons.exit_to_app,
        size: mySizeIcon,
      ),
      title: Text(
        'Sign Out',
        style: TextStyle(fontSize: h2),
      ),
      onTap: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((response) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
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
      style: TextStyle(fontSize: 13.0,color: Colors.white),
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
          listProductMenu(),
          qrCodeMenu(),
          mapMenu(),
          signOutMenu(),
        ],
      ),
    );
  }

  Widget qrCodeMenu() {
    return ListTile(
      leading: Icon(
        Icons.camera,
        size: mySizeIcon,
      ),
      title: Text(
        'Read QR Code',
        style: TextStyle(fontSize: h2),
      ),
      subtitle: Text('For Read QR code by Camera'),
      trailing: Icon(Icons.navigate_next),onTap: (){
        scanQRcode();
        Navigator.of(context).pop();
      },
    );
  }

  // Show Menu Item
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
      body: myWidget,
      drawer: myDrawerMenu(),
    );
  }
}
