import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/BMI/cal_bmi.dart';
import 'package:my_app/BMI/screenBMI/result_BMI.dart';

class MainScreenBMI extends StatefulWidget {
  @override
  _MainScreenBMIState createState() => _MainScreenBMIState();
}

class _MainScreenBMIState extends State<MainScreenBMI> {
  Color maleColor = HexColor('#3C2432');
  Color feMaleColor = HexColor('#26192D');
  var height = 100;
  var weight = 60;
  var age = 20;
//Inactive #26192D
//Active #3C2432
  void updateColor(int gender) {
    if (gender == 1) {
      maleColor = HexColor('#3C2432');
      feMaleColor = HexColor('#26192D');
    } else {
      maleColor = HexColor('#26192D');
      feMaleColor = HexColor('#3C2432');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bmi'.tr),
        backgroundColor: HexColor('#22121F'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: HexColor('#22121F'),
            padding: EdgeInsets.only(top: 10, left: 8, right: 8),
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardMale(),
                      cardFemale(),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Row(
                      children: [
                        cardHeight(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cardWeight(),
                        cardAge(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        CalculatorBrain calc =
                            CalculatorBrain(height: height, weight: weight);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultBMI(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: HexColor('#D8013C'),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'bmi'.tr,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardMale() {
    return Container(
      width: 190,
      height: 200,
      decoration: BoxDecoration(
        color: maleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          setState(() {
            updateColor(1);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.male,
              size: 100,
              color: Colors.white,
            ),
            Text(
              'male'.tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardFemale() {
    return Container(
      width: 190,
      height: 200,
      decoration: BoxDecoration(
        color: feMaleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          setState(() {
            updateColor(2);
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.female,
              size: 100,
              color: Colors.white,
            ),
            Text(
              'female'.tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardHeight() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
          color: HexColor('#3C2432'),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'height'.tr,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Slider(
                  value: height.toDouble(),
                  max: 300,
                  min: 100,
                  activeColor: HexColor('#FF024B'),
                  inactiveColor: HexColor('#7A5B60'),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
                    });
                    print(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget cardWeight() {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        color: HexColor('#3C2432'),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'weight'.tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weight.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#654F54'),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                ),
                child: Icon(
                  Icons.linear_scale,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    weight--;
                  });
                },
              ),
              SizedBox(
                width: 14,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#654F54'),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                ),
                child: Icon(
                  Icons.add,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    weight++;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget cardAge() {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        color: HexColor('#3C2432'),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'age'.tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                age.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#654F54'),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                ),
                child: Icon(
                  Icons.linear_scale,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    age--;
                  });
                },
              ),
              SizedBox(
                width: 14,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#654F54'),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(30),
                ),
                child: Icon(
                  Icons.add,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    age++;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
