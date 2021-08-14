import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class StartBuckUI extends StatefulWidget {
  @override
  _StartBuckUIState createState() => _StartBuckUIState();
}

class NewsList {
  String title;
  String image;

  NewsList(this.title, this.image);
}

class NavigaList {
  String title;
  String image;
  String url;

  NavigaList(this.title, this.image, this.url);
}

class _StartBuckUIState extends State<StartBuckUI> {
  List<NewsList> newsList = [
    NewsList("what_news".tr, "banner1.png"),
    NewsList("what_news".tr, "banner2.png"),
    NewsList("what_news".tr, "banner3.png"),
    NewsList("what_news".tr, "banner4.png"),
  ];

  List<NavigaList> navigaList = [
    NavigaList("home".tr, "banner1.png", "kk"),
    NavigaList("card".tr, "banner2.png", "kk"),
    NavigaList("order".tr, "banner3.png", "kk"),
    NavigaList("stores".tr, "banner4.png", "kk"),
  ];

  //Floating Button
  FloatingActionButtonLocation payLocation =
      FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        //title: Text('morrning'.tr),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              //padding: EdgeInsets.only(left: 20),
              child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWellcome(),
              SizedBox(
                height: 10,
              ),
              topMenu(),
              SizedBox(
                height: 8,
              ),
              starBalance(),
              SizedBox(
                height: 8,
              ),
              countItem(),
            ],
          )),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('pay'.tr),
        //icon: Icon(Icons.thumb_up),
        backgroundColor: HexColor('#00B06B'),
      ),
    );
  }

  Widget textWellcome() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            'morning'.tr,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ',' + 'Sirichai',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 9,
          ),
          Image.asset(
            "images/coffee.png",
            width: 25,
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget topMenu() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 4),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                ButtonTheme(
                  buttonColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'profile'.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {}),
                      SizedBox(
                        width: 8,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                          child: Row(
                            children: [
                              Icon(Icons.mail_outline),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'news'.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(
          //width: 100,
          // ),
          topMenuSeeting(),
          //Align(
          // alignment: Alignment.centerRight,
          //child: Icon(Icons.settings),
          //),
        ],
      ),
    );
  }

  Widget topMenuSeeting() {
    return ButtonTheme(
      minWidth: 19,
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                ),
              ],
            ),
          ),
          onPressed: () {}),
    );
  }

  Widget starBalance() {
    //Color colorBalance = const Color(433C3B);
    //Color c = const Color(0xFF42A5F5);
    return Container(
      color: HexColor('#433C3B'),
      width: MediaQuery.of(context).size.width,
      height: 183,
      padding: EdgeInsets.all(20),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          textBlance(),
          SizedBox(
            height: 10,
          ),
          rangeBlance(),
          SizedBox(
            height: 13,
          ),
          rewardButton(),
        ],
      ),
    );
  }

  Widget textBlance() {
    return Container(
      child: Row(
        children: [
          Text(
            'startBalance'.tr,
            style: TextStyle(
              fontSize: 16,
              color: HexColor('#CDC9C8'),
            ),
            //textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget rangeBlance() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '92' + ' / ',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '300',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: HexColor('#00B06B'),
            ),
            textAlign: TextAlign.end,
          ),
          Icon(
            Icons.star,
            color: HexColor('#00B06B'),
          ),
          SizedBox(
            width: 40,
          ),
          Text(
            '208' + 'lavel'.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HexColor('#00B06B'),
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Widget rewardButton() {
    return Container(
      child: Row(
        children: [
          ButtonTheme(
            buttonColor: HexColor('#433C3B'),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(17)),
            // ignore: deprecated_member_use
            child: RaisedButton(
                child: Text(
                  'rewardButton'.tr,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget countItem() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          // NewsList news = newsList[index];
          return getCard();
        });
  }

  Widget getCard() {
    return Container(
      // color: HexColor('#433C3B'),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/banner1.png"),
          fit: BoxFit.fill,
        ),
      ),
      //color: Colors.transparent,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image.asset("images/banner1.png"),
          Text(
            'what_news'.tr,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          ButtonTheme(
            buttonColor: HexColor('#00B06B'),
            shape: RoundedRectangleBorder(
                //side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(17)),
            // ignore: deprecated_member_use
            child: RaisedButton(
                child: Text(
                  'moredetail'.tr,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {}),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  Widget getButtonNaviga() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        // ignore: deprecated_member_use
        return Row(
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('data'),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
