import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckCard.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckHome.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckOrder.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckStore.dart';

class MenuNavigation extends StatefulWidget {
  @override
  _MenuNavigationState createState() => _MenuNavigationState();
}

class NavigaList {
  String title;
  String image;
  var route;
  NavigaList(this.title, this.image, this.route);
}

class _MenuNavigationState extends State<MenuNavigation> {
  bool onChecked = false;
  //var routeCard = StartBuckCard();

  List<NavigaList> navigaList = [
    NavigaList("home".tr, "star.png", StartBuckUI()),
    NavigaList("card".tr, "creditcard.png", StartBuckCard()),
    NavigaList("order".tr, "coffee.png", StartBuckOrder()),
    NavigaList("stores".tr, "store.png", StartBuckStore()),
  ];

  //State
  int selectedIndex = 0;

  void onClickMenu(int index) {
    setState(() {
      selectedIndex = index;
      //this.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: navigaList.length,
          children: List.generate(4, (index) {
            NavigaList navigation = navigaList[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonTheme(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                ImageIcon(
                                  AssetImage("images/" + '${navigation.image}'),
                                  color: selectedIndex == index
                                      ? HexColor('#05B06C')
                                      : HexColor('#808080'),
                                ),
                                Text('${navigation.title}'.tr),
                              ],
                            ),
                            color: Colors.white,
                            onPressed: () {
                              onClickMenu(index);
                              // Navigator.pushNamed(context, navigation.route);
                              MaterialPageRoute materialPageRoute =
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          navigation.route);
                              Navigator.of(context).push(materialPageRoute);
                              //print(selectedIndex.toString());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
    //   return Container(
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         ButtonTheme(
    //           padding: EdgeInsets.only(top: 5),
    //           child: Row(
    //             children: [
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                 child: Column(
    //                   children: [
    //                     Icon(
    //                       Icons.home,
    //                       color: onChecked
    //                           ? HexColor('#05B06C')
    //                           : HexColor('#00B06B'),
    //                     ),
    //                     Text('home'.tr),
    //                   ],
    //                 ),
    //                 color: Colors.white,
    //                 onPressed: () {
    //                   setState(() {
    //                     onChecked = !onChecked;
    //                   });
    //                   print(onChecked.toString());
    //                 },
    //               ),
    //               SizedBox(
    //                 width: 4,
    //               ),
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                 child: Column(
    //                   children: [
    //                     Icon(
    //                       Icons.credit_card,
    //                       color: onChecked
    //                           ? HexColor('#05B06C')
    //                           : HexColor('#00B06B'),
    //                     ),
    //                     Text('card'.tr),
    //                   ],
    //                 ),
    //                 color: Colors.white,
    //                 onPressed: () {
    //                   MaterialPageRoute materialPageRoute = MaterialPageRoute(
    //                       builder: (BuildContext context) => StartBuckCard());
    //                   Navigator.of(context).push(materialPageRoute);
    //                 },
    //               ),
    //               SizedBox(
    //                 width: 4,
    //               ),
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                 child: Column(
    //                   children: [
    //                     Icon(
    //                       Icons.online_prediction_rounded,
    //                       color: onChecked
    //                           ? HexColor('#05B06C')
    //                           : HexColor('#00B06B'),
    //                     ),
    //                     Text('order'.tr),
    //                   ],
    //                 ),
    //                 color: Colors.white,
    //                 onPressed: () {},
    //               ),
    //               SizedBox(
    //                 width: 4,
    //               ),
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                 child: Column(
    //                   children: [
    //                     Icon(
    //                       Icons.store,
    //                       color: onChecked
    //                           ? HexColor('#05B06C')
    //                           : HexColor('#00B06B'),
    //                     ),
    //                     Text('stores'.tr),
    //                   ],
    //                 ),
    //                 color: Colors.white,
    //                 onPressed: () {},
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
  }
}
