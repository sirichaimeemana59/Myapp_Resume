import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:my_app/demo_ui/startbuckUI/featuredPage.dart';
import 'package:my_app/demo_ui/startbuckUI/menuOrderPage.dart';
import 'package:my_app/demo_ui/startbuckUI/previousPage.dart';

class StartBuckOrder extends StatefulWidget {
  @override
  _StartBuckOrderState createState() => _StartBuckOrderState();
}

class StoreList {
  String title;
  String km;
  String time;
  StoreList(
    this.title,
    this.km,
    this.time,
  );
}

class _StartBuckOrderState extends State<StartBuckOrder> {
  final _MenuTabs = [
    new Tab(
      text: 'menu'.tr,
    ),
    new Tab(
      text: 'featured'.tr,
    ),
    new Tab(
      text: 'previous'.tr,
    ),
  ];

  final _MenuPage = [
    MenuOrderPage(),
    FeatureOrderPage(),
    PreviousOrderPage(),
  ];

  //DropDowm Store
  static const storeItem = <String>[
    'BDULRAHIM PLACE',
    'AIA CAPITAL CENTER',
    'ALL SEASON PLACE',
    'ASHTON CHULA-SILOM',
    'AT UNITED BANGNA'
  ];

  final List<DropdownMenuItem<String>> _dropDownStore = storeItem
      .map(
        (String value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final List<PopupMenuItem<String>> _popUpStore = storeItem
      .map(
        (String value) => PopupMenuItem(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _selectedVal1 = 'Select Store';
  String _titleStore = 'select_pickup'.tr;
  //End DropDowm Store

  List<StoreList> storeList = [
    StoreList('BDULRAHIM PLACE', '10.6 m', 'Prep time 3-5 mins'),
    StoreList('AIA CAPITAL CENTER', '1.6 m', 'Prep time 6-5 mins'),
    StoreList('ALL SEASON PLACE', '4.6 m', 'Prep time 3 mins'),
    StoreList('ASHTON CHULA-SILOM', '6.6 m', 'Prep time 8 mins'),
    StoreList('AT UNITED BANGNA', '7.6 km', 'Prep time 13 mins'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MenuTabs.length,
      child: Scaffold(
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
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: HexColor('#5E5E5E'),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                textOrder(),
                TabBar(
                  indicatorColor: HexColor('#05B06C'),
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  tabs: _MenuTabs,
                ),
                Expanded(
                  child: TabBarView(
                    children: _MenuPage,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 59,
                      color: HexColor('#423B3A'),
                      padding: EdgeInsets.only(
                          left: 11, top: 8, right: 11, bottom: 8),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boxPickupText(),
                          boxPickupBagIcon(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textOrder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 8, left: 20, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'text_order'.tr,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget boxPickupBagIcon() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ImageIcon(AssetImage("images/shoppingbag.png"),
              color: Colors.white, size: 35),
        ],
      ),
    );
  }

  Widget boxPickupText() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'pickup'.tr,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Expanded(
            child: ButtonTheme(
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (ctx) => _buildBottomSheet(ctx)),
                  child: Row(
                    children: [
                      Text(
                        _titleStore,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      // SizedBox(
                      //   width: 50,
                      // ),
                      // Icon(
                      //   Icons.arrow_drop_down,
                      //   color: Colors.white,
                      // )
                    ],
                  )),
            ),
          ),
          // Container(
          // width: 240,
          //height: 50,
          // child: DropdownButton(
          //   value: _selectedVal1,
          //   style: TextStyle(fontSize: 18, color: Colors.white),
          //   onChanged: (String newValue) {
          //     setState(() {
          //       _selectedVal1 = newValue;
          //     });
          //   },
          //   items: this._dropDownStore,
          // ),
          //),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textPopUpStore(),
            SizedBox(
              height: 6,
            ),
            textNearByStore(),
            SizedBox(
              height: 6,
            ),
            getStore(),
          ],
        ),
      ),
    );
  }

  Widget textPopUpStore() {
    return Container(
      padding: EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select_pickup'.tr,
            style: TextStyle(fontSize: 18, color: HexColor('#7B7B7B')),
          ),
          Text(
            'view_map'.tr,
            style: TextStyle(fontSize: 18, color: HexColor('#0DA970')),
          ),
        ],
      ),
    );
  }

  Widget textNearByStore() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 59,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#E1E1E1')),
      ),
      child: Row(
        children: [
          Text(
            'nearby'.tr,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget getStore() {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: storeList.length,
            itemBuilder: (context, index) {
              StoreList store = storeList[index];
              return Container(
                padding: EdgeInsets.only(right: 8, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _titleStore = store.title;
                            });
                            Navigator.pop(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                store.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                store.km,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor('#7B7B7B'),
                                ),
                              ),
                              Text(
                                store.time,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor('#7B7B7B'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.offline_bolt,
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
