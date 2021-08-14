import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/startbuckUI/UIComplonent/UIHOPS/awardUI.dart';
import 'package:my_app/demo_ui/startbuckUI/UIComplonent/UIHOPS/news.dart';
import 'package:my_app/demo_ui/startbuckUI/UIComplonent/UIHOPS/profileUI.dart';
import 'package:my_app/demo_ui/startbuckUI/UIComplonent/UIHOPS/topSlideMenuUI.dart';

class StartBuckStore extends StatefulWidget {
  @override
  _StartBuckStoreState createState() => _StartBuckStoreState();
}

class ListMenu {
  String title;
  String icon;
  ListMenu(this.title, this.icon);
}

class _StartBuckStoreState extends State<StartBuckStore> {
  List<ListMenu> listMenuSlider = [
    ListMenu('news_menu'.tr, 'ac_unit'),
    ListMenu('promotion_menu'.tr, 'promotion'),
    ListMenu('benefit_ment'.tr, 'new'),
    ListMenu('gift_menu'.tr, 'new'),
    ListMenu('event_menu'.tr, 'new'),
    ListMenu('servey_menu'.tr, 'new'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                ProfileUIHOPS(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 8, top: 120),
              child: Row(
                children: [
                  TopSlideMenuUUHOPS(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 260),
              child: Column(
                children: [
                  NewsUIHOPS(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 510),
              child: Column(
                children: [
                  AwardUI(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
