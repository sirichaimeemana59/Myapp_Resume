import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class ProfileUIHOPS extends StatefulWidget {
  @override
  _ProfileUIHOPSState createState() => _ProfileUIHOPSState();
}

class _ProfileUIHOPSState extends State<ProfileUIHOPS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 28, bottom: 14, right: 8),
      color: HexColor('#FFD602'),
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: Column(
        children: [
          imageProfile(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 43,
          height: 43,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/dog.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ร้านค้าเจริญ\nเล็งพาณิชย์(เล็ง)',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '123456 สมาชิกค้าส่ง',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   width: 8,
        // ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //textProfileDetail(),
            pointProfile(),
          ],
        )
      ],
    );
  }

  Widget textProfileDetail() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ร้านค้าเจริญเล็งพาณิชย์ (เล็ง)',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.8,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '123456 สมาชิกค้าส่ง',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget pointProfile() {
    return Container(
      width: 120,
      height: 56,
      padding: EdgeInsets.only(left: 10, right: 8, top: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pointDetail(),
          Icon(
            Icons.arrow_forward_ios,
            color: HexColor('#EF5765'),
          )
        ],
      ),
    );
  }

  Widget pointDetail() {
    return Container(
      child: Column(
        children: [
          Text(
            '1,567.68',
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#EF5765'),
            ),
          ),
          Text('คะแนนสะสม'),
        ],
      ),
    );
  }
}
