import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/shop/orderFood.dart';

class FoodShopList extends StatefulWidget {
  @override
  _FoodShopListState createState() => _FoodShopListState();
}

class Item {
  String nameTH;
  String nameEN;
  int price;
  int priceTo;
  String detailTH;
  String detailEN;
  String id;
  int numberofitems;

  Item(
      {this.nameTH,
      this.nameEN,
      this.price,
      this.detailTH,
      this.detailEN,
      this.id,
      this.numberofitems});
}

class _FoodShopListState extends State<FoodShopList> {
  var values = [];
  //Valiable
  // ignore: deprecated_member_use
  List foodList = [];
  List cartFood = [];
  int numItem = 1;
  // ignore: avoid_init_to_null
  int idItem = null;

  //End Valiable
  //setState
  void initState() {
    super.initState();
    this.fetchFoodList(null);
  }

//Cart Shop
  // ignore: missing_return
  Future<List<Item>> cartShop(
      nameTH, nameEN, price, id, numberofitems, priceTo) async {
    // ignore: deprecated_member_use
    //var values = List<Item>();
    //await Future.delayed(Duration(seconds: 2));
    //values.add(Item(
    // nameTH: nameTH,
    // nameEN: nameEN,
    //price: price,
    //id: id,
    //numberofitems: 1));
    values = [
      {
        "nameTH": nameTH,
        "nameEN": nameEN,
        "price": price,
        "id": id,
        "numberofitems": 1,
        "priceTo": price
      }
    ];

    //return values;
    if (nameTH != null) {
      if (mounted)
        setState(() {
          cartFood.addAll(values);
        });
    }

    //print(cartFood.length);
  }

//End Cart
  //End setState
  //Connect API
  fetchFoodList(id) async {
    var response = await http.get(
      Uri.http('127.0.0.1:8000', '/user_list_food_shop/' + "$id"),
    );
    //print(response.body);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var items = json.decode(response.body)['food'];
      //print('id' + status);
      if (status == 0) {
        //print('object');
        if (mounted)
          setState(() {
            foodList = [];
          });
      } else {
        if (mounted)
          setState(() {
            foodList = items;
          });
      }
    } else {
      setState(() {
        foodList = [];
      });
    }
  }

  //End Connect
  //List View
  Widget getbody() {
    return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return getCard(foodList[index]);
        });
  }

  Widget getCard(item) {
    //print(item);
    var nameTH = item['name_th'];
    var nameEN = item['name_en'];
    var price = item['price'].toString();
    var detailTH = item['detail_th'];
    //var detailEN = item['detail_en'];
    var id = item['id'];
    int numberofitems = 0;
    //var idFood = item['id_food'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(60 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/fastFood.png'),
                      //image: NetworkImage(
                      //'https://pupuphooray.com/wp-content/uploads/2019/03/dog-icon.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Food Name : " + nameTH),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Detail : " + detailTH),
                    ),
                    SizedBox(height: 8.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("Price : " + price),
                    ),
                    SizedBox(height: 8.0),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        // FlatButton.icon(
                        //   shape: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //           style: BorderStyle.solid,
                        //           width: 1.0,
                        //           color: Colors.blue.shade800),
                        //       borderRadius: BorderRadius.circular(8)),
                        //   onPressed: () {
                        //     setState(() {
                        //       idItem = id;
                        //       if (numItem > 1) {
                        //         numItem--;
                        //       }
                        //     });
                        //   },
                        //   icon: Icon(Icons.delete),
                        //   label: Text(''),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          // child: Text(
                          //   (idItem == id)
                          //       ? numItem.toString().padLeft(2, "")
                          //       : "1",
                          // ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton.icon(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.blue.shade800),
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            cartShop(nameTH, nameEN, price, id, numberofitems,
                                price);
                            // setState(() {
                            //   idItem = id;
                            //   numItem++;
                            // });
                          },
                          icon: Center(child: Icon(Icons.shopping_bag)),
                          label: Text(''),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //End view

  @override
  Widget build(BuildContext context) {
    final idShop = ModalRoute.of(context).settings.arguments;
    fetchFoodList(idShop.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('foodShop'),
        actions: [
          submitCart(),
        ],
      ),
      body: getbody(),
    );
  }

  Widget submitCart() {
    return IconButton(
        icon: Icon(Icons.shopping_basket),
        onPressed: () async {
          var materialPageRoute = MaterialPageRoute(
              builder: (context) => OrderFoodList(),
              settings: RouteSettings(arguments: cartFood));
          Navigator.push(context, materialPageRoute);

          print(cartFood.length);
        });
  }
}

// class UserID extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: FutureBuilder(
//             future: FlutterSession().get('userData'),
//             builder: (context, snapshot) {
//               return Text(snapshot.hasData ? snapshot.data : 'Loading...');
//             }));
//   }
// }
