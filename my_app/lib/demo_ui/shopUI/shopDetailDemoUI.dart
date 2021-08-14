import 'package:flutter/material.dart';
import 'package:my_app/cleass_model/shopModel.dart';

class ShopDetail extends StatefulWidget {
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  List<ShopModel> shopList = [
    ShopModel("เขียง", "เอกมัย 2", "08:00", "18:00", "k.jpeg"),
    ShopModel("ตู้กับข้าว", "เอกมัย 3", "08:00", "18:00", "t.jpeg"),
    ShopModel("ร้านอาหาร สะพานควาย", "เอกมัย 4", "08:00", "18:00", "3.jpeg"),
    ShopModel("ร้านอาหาร ยศเส", "เอกมัย 5", "08:00", "18:00", "yod.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Detail"),
        backgroundColor: Colors.red.shade900,
        elevation: 0,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.red.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 9.0,
                    spreadRadius: 8.0,
                  )
                ],
              ),
              //color: Colors.red.shade200,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(2)),
                  Image.asset(
                    "images/k.jpeg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "ร้าน : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(color: Colors.grey.shade500),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              //physics: NeverScrollableScrollPhysics(),
                              itemCount: shopList.length,
                              itemBuilder: (BuildContext context, int index) {
                                ShopModel shop = shopList[index];
                                return ListTile(
                                  title: Text("ร้าน : ${shop.name}"),
                                  subtitle: Text("ที่อยู่ : ${shop.address}"),
                                  //trailing: Text("ที่อยู่ : ${shop.address}"),
                                );
                              }),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
