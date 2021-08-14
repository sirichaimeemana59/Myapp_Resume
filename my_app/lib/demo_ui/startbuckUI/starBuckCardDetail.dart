import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:barcode/barcode.dart';
import 'package:intl/intl.dart';

class CardDetailUI extends StatefulWidget {
  @override
  _CardDetailUIState createState() => _CardDetailUIState();
}

class _CardDetailUIState extends State<CardDetailUI> {
  void buildBarcode(
    Barcode bc,
    String data, {
    double width,
    double height,
    double fontHeight,
  }) {
    /// Create the Barcode
    final svg = bc.toSvg(
      data,
      width: width ?? 200,
      height: height ?? 80,
      fontHeight: fontHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            textAddCard(),
            SizedBox(
              height: 10,
            ),
            detailCard(),
            SizedBox(
              height: 18,
            ),
            getBarCode(),
          ],
        ),
      )),
    );
  }

  Widget textAddCard() {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 6),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'pay_in_store'.tr,
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailCard() {
    var now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Container(
      padding: EdgeInsets.only(left: 24, top: 6, right: 18),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 145,
                height: 89,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/strcard.png"),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                width: 28,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '฿15.00',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor('#4C4C4C'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getBarCode() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor('#3B3632'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Text('data'),
            barCodeBackground(),
          ],
        ),
      ),
    );
  }

  Widget barCodeBackground() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      //color: Colors.black,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/barcode.jpeg"),
          fit: BoxFit.fill,
        ),
        color: Colors.black,
      ),
    );
  }
}
