import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class NewsUIHOPS extends StatefulWidget {
  @override
  _NewsUIHOPSState createState() => _NewsUIHOPSState();
}

class _NewsUIHOPSState extends State<NewsUIHOPS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 12, top: 10, right: 12),
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('news_privilege'.tr),
              newsBoxSeeAll(),
            ],
          ),
        ],
      ),
    );
  }

  Widget newsBoxSeeAll() {
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
}
