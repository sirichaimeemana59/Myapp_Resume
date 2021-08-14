import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/user/login.dart';
import 'package:my_app/user/user.dart';
//import 'dart:convert' as convert;

import 'register.dart';
//import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final locales = [
    {
      'name': 'English',
      'locale': Locale('en'),
    },
    {
      'name': 'Thailind',
      'locale': Locale('th'),
    }
  ];
//Method

  Widget showLogo() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/resume.png'),
    );
  }

  Widget showAppName() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Text(
      'app_name'.tr,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arvo',
      ),
    );
  }

  Widget singInButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => LoginForm());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget registerButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.green.shade700,
      child: Text('Register', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget apiTestButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => UserList());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        singInButton(),
        SizedBox(
          width: 8.0,
        ),
        registerButton(),
        SizedBox(
          width: 8.0,
        ),
        textHelp(),
        //apiTestButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //สร้าง Object ให้อยู่ใน View
      body:
          //SafeArea เก็บวัตถุได้เพียง 1 ตัว และมีค่าเป็น child
          //child: showAppName(),
          // child: FutureBuilder<UserModel>(
          //   future: getUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       // final user = snapshot.data;

          //       return Text("Name");
          //     } else if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),
          //     //User Column เรียงวัตถุจากบนลงล่าง
          Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/PetBackground.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [
              SizedBox(
                height: 500.0,
              ),
              showAppName(),
              SizedBox(
                height: 30.0,
              ),
              showButton(),
            ],
          ),
        ),
      ),
    );
    // end Column
    //User row เรียงวัตถุจาซ้ายไปขวา
    //     child: Row(
    //   children: [showAppName(), showAppName(), showAppName(), showAppName()],
    // )),
    // end row
    ;
  }

  Widget textHelp() {
    return Container(
        padding: EdgeInsets.all(17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              // ignore: deprecated_member_use
              child: FlatButton(
                minWidth: 39,
                height: 29,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Image.asset(
                  "images/TH.png",
                  width: 30,
                  height: 21,
                ),
                padding: EdgeInsets.all(0),
                color: Colors.transparent,
                onPressed: () {
                  languageAlertDialog(context);
                },
              ),
            ),
          ],
        ));
  }

  languageAlertDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                content: Container(
                  width: 250,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      rowLanguageTHAlertDialog(),
                      rowLanguageENAlertDialog(),
                    ],
                  ),
                ),
                title: textTileAlertDialog());
          });
        });
  }

  Widget textTileAlertDialog() {
    return Text(
      "เลือกภาษา",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget rowLanguageTHAlertDialog() {
    return Container(
      child: ButtonTheme(
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            updateLocale(locales[1]['locale'], context);
          },
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/TH.png",
                width: 35,
                height: 35,
              ),
              SizedBox(
                width: 15,
              ),
              Text('ภาษาไทย'),
              // SizedBox(
              //   width: 80,
              // ),
              // Icon(Icons.check),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowLanguageENAlertDialog() {
    return Container(
      child: ButtonTheme(
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            // ignore: unnecessary_brace_in_string_interps
            updateLocale(locales[0]['locale'], context);
            //setLocale(Locale.fromSubtags(languageCode: 'en'));
            //print(locale.toString());
          },
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/EN.png",
                width: 35,
                height: 35,
              ),
              SizedBox(
                width: 15,
              ),
              Text('ภาษาอังกฤษ'),
            ],
          ),
        ),
      ),
    );
  }

  updateLocale(Locale locale, BuildContext context) {
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }
}
