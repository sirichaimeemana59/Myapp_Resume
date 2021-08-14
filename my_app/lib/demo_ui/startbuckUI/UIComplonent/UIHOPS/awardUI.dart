import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class AwardUI extends StatefulWidget {
  @override
  _AwardUIState createState() => _AwardUIState();
}

class ListMenu {
  String title;
  String icon;
  ListMenu(this.title, this.icon);
}

class _AwardUIState extends State<AwardUI> {
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
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      height: 300,
      color: Colors.white,
      child: Column(
        children: [
          benefitBox(),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            //  color: Colors.red,
            child: Column(
              children: [
                getListBenefitMenu(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget benefitBox() {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('benefit_recom'.tr),
              benefitBoxSeeAll(),
            ],
          )
        ],
      ),
    );
  }

  Widget benefitBoxSeeAll() {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'see_all'.tr,
                style: TextStyle(
                  color: HexColor('#53C6EB'),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: HexColor('#53C6EB'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getListBenefitMenu() {
    return Container(
      child: Expanded(
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 2.0,
          children: List.generate(
            listMenuSlider.length,
            (index) {
              return Container(
                padding: EdgeInsets.only(left: 18, top: 18),
                width: 300,
                height: 290,
                //color: Colors.blue,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                offset: Offset(3, 2),
                              )
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 12, left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/dog.png',
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('ชื่อสินค้า'),
                                Text('2,000'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 45, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              color: HexColor('#FFD602'),
                              borderRadius: BorderRadius.circular(18),
                              //border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'trade_now'.tr,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
