import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderFoodList extends StatefulWidget {
  @override
  _OrderFoodListState createState() => _OrderFoodListState();
}

class _OrderFoodListState extends State<OrderFoodList> {
  List orderList = [];
  int summaryPrice = 0;
  int price = 0;
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context).settings.arguments;
    orderList = order;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        title: Text('Order'),
        actions: [
          shoppingAgain(),
        ],
      ),
      body: createListView(),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        //summaryPrice +=  price;
        //print(summaryPrice);
        return Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.white70,
            border: Border.all(width: 2.0, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage('images/dog.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 15, bottom: 5),
                                  child: Text(
                                    orderList[index]['nameTH'],
                                  ))),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                'Price : ',
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                orderList[index]['price'].toString(),
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                'Amount : ',
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 15, bottom: 5),
                              child: Text(
                                orderList[index]['numberofitems'].toString(),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (orderList[index]['numberofitems'] > 1) {
                          setState(() {
                            orderList[index]['numberofitems'] =
                                orderList[index]['numberofitems'] - 1;
                            price = int.parse(orderList[index]['price']) -
                                int.parse(orderList[index]['priceTo']);
                            orderList[index]['price'] = price.toString();
                            // orderList[index]['price'] = int.parse(
                            //     orderList[index]['price'] -
                            //         orderList[index]['price']);
                          });
                        }
                      },
                      child: Container(
                        width: 30,
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.blue.shade800,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 40,
                      child: Center(
                          child: Text(
                        orderList[index]['numberofitems'].toString(),
                        style: TextStyle(fontSize: 25),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          orderList[index]['numberofitems'] =
                              orderList[index]['numberofitems'] + 1;
                          price = int.parse(orderList[index]['priceTo']) +
                              int.parse(orderList[index]['price']);
                          orderList[index]['price'] = price.toString();

                          // print(price);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        width: 30,
                        child: Icon(
                          Icons.add_circle_outline,
                          color: Colors.blue.shade800,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget shoppingAgain() {
    return IconButton(
        icon: Icon(Icons.shopping_basket),
        onPressed: () async {
          createOrder();
        });
  }

  createOrder() async {
    var order = jsonEncode(orderList);
    var response = await http.post(
        Uri.http('127.0.0.1:8000', '/user_create_order'),
        body: order,
        headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      print('success');
    } else {}
  }
}
