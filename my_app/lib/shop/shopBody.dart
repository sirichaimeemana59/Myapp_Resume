//import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/cleass_model/shopList.dart';
import 'package:my_app/shop/categories.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/shop/foodShopList.dart';

// ignore: must_be_immutable
class ShopBody extends StatefulWidget {
  //Connect API
  // ignore: deprecated_member_use
  @override
  _ShopBodyState createState() => _ShopBodyState();
}

class _ShopBodyState extends State<ShopBody> {
  // ignore: deprecated_member_use
  List<ShopList> shop = List<ShopList>();
  List dataShop = [];
  //End Valiable
  //setState
  void initState() {
    super.initState();
    this.fetchShopData();
  }

  //End State

  Future<List<ShopList>> fetchShop() async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_list_shop'),
    );

    // ignore: deprecated_member_use
    var shop = List<ShopList>();
    if (response.statusCode == 200) {
      var shopJson = json.decode(response.body)['shop'];
      setState(() {
        shop = shopJson;
      });
    }
    return shop;
  }

  //Connect API
  fetchShopData() async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_list_shop'),
    );

    if (response.statusCode == 200) {
      var items = json.decode(response.body)['shop'];
      var status = json.decode(response.body)['status'];

      if (status == 0) {
        // print("id");
        if (mounted)
          setState(() {
            dataShop = [];
          });
      } else {
        if (mounted)
          setState(() {
            dataShop = items;
          });
      }
    } else {
      //print("id");
      if (mounted)
        setState(() {
          dataShop = [];
        });
    }
  }
  //End Connect API

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Categories(),
        // Text(dataShop[0]['name_th'].toString()),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: dataShop.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 25,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => itemCard(dataShop[index]),
          ),
        )),
      ],
    );
  }

  Widget itemCard(item) {
    var id = item['id'];
    var nameTH = item['name_th'];
    //var nameEN = item['name_en'];
    //var detailTH = item['detai_th'];
    //var detailEN = item['detai_en'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.white,
          splashColor: Colors.white,
          padding: EdgeInsets.all(1),
          onPressed: () {
            //  print('object');
            showFoodList(id);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            //height: 180,
            //width: 160,
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(16)),
            child: Image.asset('images/dog.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              '$nameTH',
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ),
        ),
      ],
    );
  }

  showFoodList(id) {
    var materialPageRoute = MaterialPageRoute(
        builder: (context) => FoodShopList(),
        settings: RouteSettings(arguments: id));
    Navigator.push(context, materialPageRoute);
  }
}
