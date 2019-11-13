/*
Name: Akshath Jain
Date: 3/18/19
Purpose: Example app that implements the package: sliding_up_panel
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';

// uncomment the following lines before running; there's an ongoing issue with
// pub that causes warnings to be thrown when analyzing nested flutter
// packages - issue #17168, https://github.com/flutter/flutter/issues/17168

// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class SlidingUpPanelExample extends StatelessWidget {
  final Map<String, dynamic> product;

  SlidingUpPanelExample({this.product});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SlidingUpPanel Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        product: product,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> product;

  HomePage({this.product});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen = 700.0;
  double _panelHeightClosed = 575.0; // when page open

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panel: _panel(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          Positioned(
              bottom: 20.0,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      'assets/drawable-xxxhdpi/Add-to-Cart.png',
                      width: 60.0,
                      height: 60.0,
                    ),
                    onTap: () {
//                      Navigator.pop(context);
//                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image.asset(
                    'assets/drawable-xxxhdpi/Bookmarks.png',
                    width: 60.0,
                    height: 60.0,
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _panel() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 50, left: 50, bottom: 20),
            child: CachedNetworkImage(
              imageUrl: widget.product['image'],
              fit: BoxFit.fill,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.product['price']),
                  Text('4.96'),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.product['title'],
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '332 Reviews',
                        style:
                            TextStyle(color: Color(0xffB7B7B7), fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  'PRODUCT INFORMATION',
                ),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '70 cm',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'width',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '70 cm',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'Depth',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '70 cm',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'Height',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '70 cm',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'Drawer Width',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '70 cm',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'Draver Depth',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '7 kg',
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(
                            'Max Load',
                            style: TextStyle(color: Color(0xffB7B7B7)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'PRODUCT INFORMATION',
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Of course your home should be a safe place for the entire family. That’s why hardware is included so that you can attach the chest of drawers to the wall. \n\n Of course your home should be a safe place for the entire family. That’s why hardware is included so that you can attach the chest of drawers to the wall.',
                      style: TextStyle(fontFamily: "Regular", fontSize: 18.0),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  'PRODUCT INFORMATION',
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Of course your home should be a safe place for the entire family. That’s why hardware is included so that you can attach the chest of drawers to the wall. \n\n Of course your home should be a safe place for the entire family. That’s why hardware is included so that you can attach the chest of drawers to the wall.',
                      style: TextStyle(fontFamily: "Regular", fontSize: 18.0),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/drawable-hdpi/Image.png'),
                  fit: BoxFit.fill)),
        ),

//        Padding(
//          padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 20.0),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              InkWell(
//                child: Image.asset('assets/drawable-xxxhdpi/Menu.png', width: 60, height: 40,),
//              ),InkWell(
//                child: Image.asset('assets/drawable-xxxhdpi/Shopping-Cart.png', width: 60, height: 40,),
//              ),
//            ],
//          ),
//        )
      ],
    );
  }
}
