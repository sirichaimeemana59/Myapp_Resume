import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckCard.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckHome.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckOrder.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckStore.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class NavigaList {
  String title;
  String image;
  var route;
  NavigaList(this.title, this.image, this.route);
}

class _TabViewScreenState extends State<TabBarView> {
  List<NavigaList> navigaList = [
    NavigaList("home".tr, "star.png", StartBuckUI()),
    NavigaList("card".tr, "creditcard.png", StartBuckCard()),
    NavigaList("order".tr, "coffee.png", StartBuckOrder()),
    NavigaList("stores".tr, "store.png", StartBuckStore()),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: navigaList.length,
        child: Scaffold(
          body: TabBarView(
            children: [
              //StartBuckUI(),
            ],
          ),
        ));
  }
}
