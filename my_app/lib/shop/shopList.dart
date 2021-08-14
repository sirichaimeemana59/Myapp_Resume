import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/shop/foodShopList.dart';
import 'package:my_app/shop/shopBody.dart';

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  //Valiable
  List dataFood = [];
  //End Valiable
  //setState
  void initState() {
    super.initState();
    this.fetchFoodData();
  }

  //End State
  //Widget
  Widget getBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataFood.length,
      itemBuilder: (context, index) {
        return showCardBox(dataFood[index]);
      },
    );
  }

  Widget showCardBox(items) {
    var nameShop = items['name_th'];
    var id = items['id'];
    return Container(
      width: 550.0,
      height: 230.0,
      alignment: Alignment.center,
      //color: Colors.black,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      // ignore: deprecated_member_use
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          //child: Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            primary: false,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  showFoodList(id);
                },
                child: Container(
                  width: 550.0,
                  height: 230.0,
                  //color: Colors.black,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    //child: Padding(
                    // padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/shop.png'),
                          height: 100,
                        ),
                        Text(
                          nameShop,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //),
            ],
          ),
        ),
      ),

      //),
    );
  }

  //Connect API
  fetchFoodData() async {
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
            dataFood = [];
          });
      } else {
        if (mounted)
          setState(() {
            dataFood = items;
          });
      }
    } else {
      //print("id");
      if (mounted)
        setState(() {
          dataFood = [];
        });
    }
  }
  //End Connect API

//Show foodList
  showFoodList(id) {
    var materialPageRoute = MaterialPageRoute(
        builder: (context) => FoodShopList(),
        settings: RouteSettings(arguments: id));
    Navigator.push(context, materialPageRoute);
  }

//
  //End Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ShopBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.yellow.shade800,
      title: Text('SHOP'),
      actions: [],
    );
  }
}
