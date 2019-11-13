import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture/ProductDetails.dart';
import 'package:furniture/Test.dart';

class PopularProduct extends StatefulWidget {
  final String image, title, price;
  final Map<String, dynamic> product;

  PopularProduct({this.image, this.title, this.price, this.product});

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
      InkWell(
        onTap: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: widget.product,)));
          Navigator.push(context, MaterialPageRoute(builder: (context) => SlidingUpPanelExample(product: widget.product,)));
        },
        child: Container(
            width: 140.0,
            decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffF6F6F6))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 120.0,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        new Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(widget.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff131417))),
                      ),
                      Container(
                        child: Text(widget.price,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff131417))),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
