import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {


  final Map<String, dynamic> product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.product['title']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.product['title']),
      ),
    );
  }
}
