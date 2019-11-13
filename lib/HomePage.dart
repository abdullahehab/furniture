import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture/popularProduct.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height;
  bool tapped = false;

  List products = [
    {
      "image":
          "https://ii1.pepperfry.com/media/catalog/product/d/o/800x880/doloris-stylish-tufted-chair-in-beige-colour-by-dreamzz-furniture-doloris-stylish-tufted-chair-in-be-0ahswj.jpg",
      "title": "Nest Chair",
      "price": "95.50",
      "review" : "332"
    },
    {
      "image":
          "https://www.lookinggoodfurniture.com/wp-content/uploads/2018/03/Lepidium-sofa.jpg",
      "title": "knaba",
      "price": "95.50",
      "review" : "255"
    },
    {
      "image":
          "https://ii1.pepperfry.com/media/catalog/product/r/e/800x880/regal-3-door-wardrobe-by-trevi-furniture-regal-3-door-wardrobe-by-trevi-furniture-3dxzcy.jpg",
      "title": "dolab",
      "price": "95.50",
      "review" : "200"
    },
    {
      "image":
          "https://cdn.shopify.com/s/files/1/0258/1394/2371/products/Spine_Chair_540x.jpg?v=1569268227",
      "title": "Korsy",
      "price": "95.50",
      "review" : "500"
    },
  ];

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Container(
//                    width: 20,
//                    height: 5,
//                    decoration: BoxDecoration(
//                        color: Colors.grey[300],
//                        borderRadius: BorderRadius.all(Radius.circular(20.0))
//                    ),
//                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (String val) {
//                            FocusScope.of(context).requestFocus(textSecondFocusNode);
                            },
                            onTap: () {
                              print('tapped');
                            },
                            onEditingComplete: () {
//                            onScreenProducts.clear();
//                            print('complete');
//                            searchApi(myController.text, "main");
//                            isCallingApi = true;
                            },
//                          controller: myController,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                              hintText: 'Search for profucts',
                              contentPadding: EdgeInsets.only(top: 15.0),
                              hintStyle: TextStyle(
                              )
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text('Categories'),
              ),
              Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                          'All Products',
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Color(0xffFEC010),
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('POPULAR PRODUCTS'),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      print(products);
                      return PopularProduct(
                        image: products[index]['image'],
                        title: products[index]['title'],
                        price: products[index]['price'],
                        product: products[index],
                      );
                    }),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tapped = false;
    height = 0.0;
    print(products.length);
    print(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: Image.asset(
                'assets/drawable-xxxhdpi/Capture.png',
                width: 30.0,
                height: 30.0,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/drawable-xxxhdpi/Add-Furniture.png',
                width: 60.0,
                height: 60.0,
              ),
              onTap: () {
                _showModalSheet();
              },
            ),
            InkWell(
              child: Image.asset(
                'assets/drawable-xxxhdpi/Bookmarks.png',
                width: 30.0,
                height: 30.0,
              ),
            ),
          ],
        ),
        body:
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/drawable-hdpi/Image.png'),
                      fit: BoxFit.fill)),
            ),


          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Image.asset('assets/drawable-xxxhdpi/Menu.png', width: 60, height: 40,),
                ),InkWell(
                  child: Image.asset('assets/drawable-xxxhdpi/Shopping-Cart.png', width: 60, height: 40,),
                ),
              ],
            ),
          )
          ],
        ));
  }
}
