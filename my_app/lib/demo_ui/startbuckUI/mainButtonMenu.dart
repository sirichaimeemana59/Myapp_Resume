import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckCard.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckHome.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckOrder.dart';
import 'package:my_app/demo_ui/startbuckUI/startbuckStore.dart';

class MainButtonMenu extends StatefulWidget {
  @override
  _MainButtonMenuState createState() => _MainButtonMenuState();
}

class _MainButtonMenuState extends State<MainButtonMenu> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      StartBuckUI(),
      StartBuckCard(),
      StartBuckOrder(),
      StartBuckStore(),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/star.png')), label: 'home'.tr),
      new BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/creditcard.png')),
          label: 'card'.tr),
      new BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/coffee.png')), label: 'order'.tr),
      new BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('images/store.png')), label: 'stores'.tr),
    ];
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: HexColor('#05B06C'),
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: _kTabPages[_currentTabIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: bottomNavBar,
          )),
    );
  }
}
