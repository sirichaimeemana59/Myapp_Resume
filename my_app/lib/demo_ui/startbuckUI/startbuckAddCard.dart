import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:my_app/startbucksProviders/cardModelProvider.dart';
import 'package:my_app/startbucksProviders/startBucksProvider.dart';
import 'package:provider/provider.dart';

class StarBucksAddCard extends StatefulWidget {
  @override
  _StarBucksAddCardState createState() => _StarBucksAddCardState();
}

class _StarBucksAddCardState extends State<StarBucksAddCard> {
  final formKey = GlobalKey<FormState>();
  final cardNumber = TextEditingController();
  final verifyNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              //padding: EdgeInsets.only(left: 20, right: 18),
              child: Column(
                children: [
                  textAddCard(),
                  outlineShadow(),
                  SizedBox(
                    height: 40,
                  ),
                  getCard(),
                ],
              ),
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
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  var cardNo = cardNumber.text;
                  var codeVer = verifyNumber.text;
                  var date = DateTime.now();

                  CardModersStarbucks statement = CardModersStarbucks(
                    cardNumber: cardNo,
                    verifyCard: codeVer,
                    date: date,
                  );
                  var provider =
                      Provider.of<StartBucksProviders>(context, listen: false);

                  provider.addCardStarbucksList(statement);
                  Navigator.pop(context);
                } else {}
                // StartBucksProviders transectionProvider = StartBucksProviders();
                //print(transectionProvider.cardStarbucksList.first);
              },
              label: Text(
                'addcardNew'.tr,
                style: TextStyle(color: Colors.white),
              ),
              //icon: Icon(Icons.thumb_up),
              backgroundColor: HexColor('#00BB82'),
            ),
          ],
        ),
      ),
    );
  }

  Widget textAddCard() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            'addcard'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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

  Widget getCard() {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //image: AssetImage("images/strcard.png"),
        //fit: BoxFit.fill,
        //),
        color: HexColor('#FFFFFF'),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
              color: HexColor('#C0C0C0'),
              offset: Offset(1.0, 8.0),
              blurRadius: 5.0)
        ],
      ),
      //padding: EdgeInsets.all(20),
      height: 211,
      width: MediaQuery.of(context).size.width - 28,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor('#F9F9F9'),
                  borderRadius: BorderRadius.circular(9),
                ),
                width: 80,
                height: 211,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [
                      Image.asset(
                        'images/startbuck.png',
                        width: 60,
                        height: 60,
                      ),
                      Container(
                        width: 250,
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            textNumberCard(),
                            textNumberCardCSC(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 170,
                ),
                child: outlineGold(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget outlineGold() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      decoration: BoxDecoration(
        color: HexColor('#D4BD80'),
        //boxShadow: BoxShadow.lerp(2, 2, 2),
      ),
    );
  }

  Widget textNumberCard() {
    return TextFormField(
      autofocus: true,
      controller: cardNumber,
      decoration: InputDecoration(
        labelText: 'numberCard'.tr,
        labelStyle:
            TextStyle(color: HexColor('#E3E3E3'), fontWeight: FontWeight.bold),
        helperText: 'place_key_card_number'.tr,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'place_key_card_number'.tr;
        } else {
          return null;
        }
      },
    );
  }

  Widget textNumberCardCSC() {
    return TextFormField(
      controller: verifyNumber,
      decoration: InputDecoration(
        labelText: 'scs'.tr,
        labelStyle:
            TextStyle(color: HexColor('#E3E3E3'), fontWeight: FontWeight.bold),
        helperText: 'place_key_card_verify'.tr,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'place_key_card_verify'.tr;
        } else {
          return null;
        }
      },
    );
  }
}
