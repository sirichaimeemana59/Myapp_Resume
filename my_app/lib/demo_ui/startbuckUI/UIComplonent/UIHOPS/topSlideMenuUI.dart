import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class TopSlideMenuUUHOPS extends StatefulWidget {
  @override
  _TopSlideMenuUUHOPSState createState() => _TopSlideMenuUUHOPSState();
}

class ListMenu {
  String title;
  String icon;
  ListMenu(this.title, this.icon);
}

class _TopSlideMenuUUHOPSState extends State<TopSlideMenuUUHOPS> {
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: Offset(0.1, 10),
          )
        ],
      ),
      child: Column(
        children: [
          getListMenu(),
        ],
      ),
    );
  }

  Widget getListMenu() {
    return Container(
      child: Expanded(
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          children: List.generate(
            listMenuSlider.length,
            (index) {
              ListMenu menuslide = listMenuSlider[index];
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: HexColor('#C2DBF9'),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.ac_unit,
                                size: 40,
                                color: HexColor('#4ECAEB'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          menuslide.title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
