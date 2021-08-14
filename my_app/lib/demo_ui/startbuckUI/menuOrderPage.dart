import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class MenuOrderPage extends StatefulWidget {
  @override
  _MenuOrderPageState createState() => _MenuOrderPageState();
}

class ProductList {
  String title;
  String image;
  ProductList(
    this.title,
    this.image,
  );
}

class _MenuOrderPageState extends State<MenuOrderPage> {
  List<ProductList> productList = [
    ProductList("Hot Coffees", "product.png"),
    ProductList("Hot Teas", "product.png"),
    ProductList("Other Hot Beverages", "product.png"),
    ProductList("Cold Coffees", "product.png"),
    ProductList("Cold Teas", "product.png"),
    ProductList("Other Cold Beverages", "product.png"),
    ProductList("Frappuccino", "product.png"),
    ProductList("Bottled Drinks", "product.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        textProduct(),
        SizedBox(
          height: 8,
        ),
        getProduct(),
        //Text('data'),
        //Text('data'),
      ],
    ));
  }

  Widget textProduct() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 16, left: 20, right: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Drinks',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'see_all'.tr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: HexColor('#05B06C')),
          ),
        ],
      ),
    );
  }

  Widget getProduct() {
    return Container(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                ProductList product = productList[index];
                return Container(
                  padding: EdgeInsets.only(bottom: 29, left: 14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: HexColor('#053C2F'),
                              borderRadius: BorderRadius.circular(26),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/${product.image}"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(product.title)
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
