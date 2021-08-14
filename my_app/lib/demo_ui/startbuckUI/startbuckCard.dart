import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/demo_ui/startbuckUI/UIComplonent/startbuckComplonent/listcardConsumer.dart';
import 'package:my_app/demo_ui/startbuckUI/starBuckCardDetail.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckAddCard.dart';
import 'package:my_app/startbucksProviders/startBucksProvider.dart';
import 'package:provider/provider.dart';

class StartBuckCard extends StatefulWidget {
  const StartBuckCard({Key key}) : super(key: key);
  @override
  _StartBuckCardState createState() => _StartBuckCardState();
}

class _StartBuckCardState extends State<StartBuckCard> {
  void initState() {
    //ประกาศเมื่อต้องการให้ทำการตั้งแต่เริ่มต้น
    super.initState();
    Provider.of<StartBucksProviders>(context, listen: false).initData();
  }

  //Floating Button
  FloatingActionButtonLocation payLocation =
      FloatingActionButtonLocation.endDocked;

  //Image
  // ignore: unused_field
  File _imageFile;
  // ignore: unused_field
  final _picker = ImagePicker();
  //PermissionStatus _permissionStatus;
  void onLayoutDone(Duration timeStamp) async {
    // _permissionStatus = await Permission.camera.status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 0),
            child: ButtonTheme(
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => StarBucksAddCard());
                  Navigator.of(context).push(materialPageRoute);
                },
                child: Icon(
                  Icons.add_circle,
                  color: HexColor('#5E5E5E'),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //padding: EdgeInsets.only(left: 20, right: 18),
            child: Column(
              children: [
                textCard(),
                outlineShadow(),
                textTime(),
                textCurren(),
                getCard(),
                textAnotherCard(),
                StartBucksListCardUI(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   //padding: EdgeInsets.only(right: 8),
      //   width: MediaQuery.of(context).size.width,
      //   height: 55,
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       MenuNavigation(),
      //     ],
      //   ),
      // ),
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: Text(
                'add_money'.tr,
                style: TextStyle(color: Colors.black),
              ),
              //icon: Icon(Icons.thumb_up),
              backgroundColor: HexColor('#FFFFFF'),
            ),
            SizedBox(
              height: 8,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: Text('pay'.tr),
              //icon: Icon(Icons.thumb_up),
              backgroundColor: HexColor('#00B06B'),
            ),
          ],
        ),
      ),
    );
  }

  Widget textCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8, left: 20, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'startbuck_card'.tr,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget outlineShadow() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8,
      decoration: BoxDecoration(
        //color: Colors.black,
        //boxShadow: BoxShadow.lerp(2, 2, 2),
        boxShadow: [
          BoxShadow(
              color: HexColor('#C0C0C0'),
              offset: Offset(0.0, 20.0),
              blurRadius: 3.0)
        ],
      ),
    );
  }

  Widget textTime() {
    var now = DateTime.now();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30, left: 20, right: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                now.toString(),
                style: TextStyle(fontSize: 16, color: HexColor('#4C4C4C')),
              ),
              ButtonTheme(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget),
                    );
                  },
                  child: Icon(Icons.refresh),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget textCurren() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '฿0.00',
                style: TextStyle(
                    fontSize: 22,
                    color: HexColor('#4C4C4C'),
                    fontWeight: FontWeight.bold),
              ),
              buttonDetailCurren(),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonDetailCurren() {
    return ButtonTheme(
      buttonColor: HexColor('#FFFFFF'),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: HexColor('#00B06B')),
          borderRadius: BorderRadius.circular(17)),
      // ignore: deprecated_member_use
      child: RaisedButton(
          child: Text(
            'moredetail'.tr,
            style: TextStyle(
              color: HexColor('#00B06B'),
            ),
          ),
          onPressed: () {}),
    );
  }

  Widget getCard() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => CardDetailUI());
        Navigator.of(context).push(materialPageRoute);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/strcard.png"),
            fit: BoxFit.fill,
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        //padding: EdgeInsets.all(20),
        height: 197,
        width: MediaQuery.of(context).size.width - 28,
      ),
    );
  }

  Widget textAnotherCard() {
    return Container(
      padding: EdgeInsets.all(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'anotherCard'.tr,
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#44403F'),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCardOther() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      //child: Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () async {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => StarBucksAddCard());
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
                //width: 159,
                height: 99,
                padding: EdgeInsets.all(20),
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
    );
  }
}
