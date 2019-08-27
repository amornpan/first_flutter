import 'package:first_flutter/models/product_model.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final ProductModel productModel;
  Detail({Key key, this.productModel}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //Explicit
  ProductModel myProductModel;

  //Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myProductModel = widget.productModel;
    });
  }

  Widget showName() {
    return Text('Detail of ${myProductModel.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showName(),
      ),
      body: Text('Body'),
    );
  }
}
