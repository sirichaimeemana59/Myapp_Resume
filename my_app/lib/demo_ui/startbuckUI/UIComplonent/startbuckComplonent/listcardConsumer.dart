import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckAddCard.dart';
import 'package:my_app/startbucksProviders/cardModelProvider.dart';
import 'package:my_app/startbucksProviders/startBucksProvider.dart';
import 'package:provider/provider.dart';

class StartBucksListCardUI extends StatefulWidget {
  @override
  _StartBucksListCardUIState createState() => _StartBucksListCardUIState();
}

class _StartBucksListCardUIState extends State<StartBucksListCardUI> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (context, StartBucksProviders startBucksProviders, Widget child) {
        var count = startBucksProviders.cardStarbucksList.length;
        print(count.toString());
        if (count < 0) {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
            ),
          );
        } else {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  children: List.generate(
                    count,
                    (index) {
                      CardModersStarbucks data =
                          startBucksProviders.cardStarbucksList[
                              index]; //เข้าถึงข้อมูล List จาก Model ทีละตัว
                      //  print(data.cardNumber);
                      return Center(
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              //color: Colors.black,
                              child: Column(
                                children: [
                                  DottedBorder(
                                    borderType: BorderType.RRect,
                                    dashPattern: [10, 3],
                                    color: HexColor('#B1B1B1'),
                                    radius: Radius.circular(6),
                                    child: Container(
                                      //width: 155,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        color: HexColor('#EAEAEA'),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      //padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "images/strcard.png",
                                            fit: BoxFit.fill,
                                            height: 105,
                                          ),
//                                  Text('Sirichai Meemana (2564)')
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('Sirichai Meemana (2021)')
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 4),
                //child: Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () async {
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                StarBucksAddCard());
                        Navigator.of(context).push(materialPageRoute);
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [10, 3],
                        color: HexColor('#B1B1B1'),
                        radius: Radius.circular(6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#EAEAEA'),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 159,
                          height: 99,
                          //padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: HexColor('#8B8B8B'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'addcard'.tr,
                                style: TextStyle(
                                  color: HexColor('#8B8B8B'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //),
              ),
            ],
          );
        }
      },
    );
  }
}
