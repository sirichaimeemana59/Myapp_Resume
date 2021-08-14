import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/shopUI/shopUIdemo.dart';

class HomeUIDesign extends StatefulWidget {
  @override
  _HomeUIDesignState createState() => _HomeUIDesignState();
}

class _HomeUIDesignState extends State<HomeUIDesign> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          elevation: 0, //None Border Appbar
        ),

        // translations: TextTranslations(),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade900,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showLogo(),

                //Text("UI SIRICHAI"),
                showButton(),
                textHelp(),
              ],
            )),
          ),
        ));
  }

  Widget showButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loginButton(),
          SizedBox(
            height: 34,
          ),
          Text(
            'noneacc'.tr,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          registerButton(),
        ],
      ),
    );
  }

  Widget loginButton() {
    return ButtonTheme(
        minWidth: 276,
        height: 52,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.red.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.white)),
            child: Text(
              'login'.tr,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => ShopUIDemo());
              Navigator.of(context).push(materialPageRoute);
            }));
  }

  Widget registerButton() {
    return ButtonTheme(
        minWidth: 276,
        height: 52,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.yellow.shade600,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.yellow.shade600)),
            child: Text(
              'register'.tr,
              style: TextStyle(color: Colors.red.shade900, fontSize: 25),
            ),
            onPressed: () {}));
  }

  Widget showLogo() {
    return Container(
        width: 150,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/dog.png"),
          ],
        ));
  }

  Widget textHelp() {
    return Container(
        padding: EdgeInsets.all(17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                'help'.tr,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'click'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(0),
                color: Colors.red.shade900,
              ),
            ),
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
      'slectLang'.tr,
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
            //print(locales[1]['locale']);
            updateLocale(locales[1]['locale'], context);

            //setLocale(Locale.fromSubtags(languageCode: 'th'));
            //print(locale.toString());
            // MaterialPageRoute materialPageRoute = MaterialPageRoute(
            //     builder: (BuildContext context) => Myapp(),
            //     settings: RouteSettings(arguments: 'th'));
            // Navigator.of(context).push(materialPageRoute);
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
              Text('th'.tr),
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
            updateLocale(locales[0]['locale'], context);
            //setLocale(Locale.fromSubtags(languageCode: 'en'));
            //print(locale.toString());
            // MaterialPageRoute materialPageRoute = MaterialPageRoute(
            //     builder: (BuildContext context) => Myapp(),
            //     settings: RouteSettings(arguments: 'en'));
            // Navigator.of(context).push(materialPageRoute);
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
              Text('en'.tr),
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
