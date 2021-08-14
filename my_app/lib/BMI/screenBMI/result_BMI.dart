import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultBMI extends StatelessWidget {
  ResultBMI({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  final bmiResult;
  final resultText;
  final interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bmi'.tr),
        backgroundColor: HexColor('#22121F'),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        color: HexColor('#22121F'),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'result'.tr,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              resultText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              bmiResult,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                interpretation,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
