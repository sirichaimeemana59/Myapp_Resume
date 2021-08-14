import 'package:flutter/material.dart';
import 'package:my_app/BMI/screenBMI/main_screen_BMI.dart';
import 'package:my_app/demo_ui/startbuckUI/mainButtonMenu.dart';
import 'package:my_app/demo_ui/work_ui/home_ui.dart';
import 'package:my_app/googleUI/google_map_home.dart';
import 'package:my_app/pets/petList.dart';
import 'package:my_app/screenproviders/mainscreen_providers.dart';
import 'package:my_app/shop/shopList.dart';
import 'package:get/get.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //Explicit
  String username = '';
  Widget showCurrentWidget = PetControler();
  //EndExplicit
  //Method
  Widget showListMenuSales() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('ระบบขายสินค้า'),
      onTap: () {
        //print('object');
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => ShopList());
        Navigator.of(context).push(materialPageRoute);

        //Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuPets() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('ระบบบันทึกข้อมูลสัตว์เลี้ยง'),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => PetControler());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuUI() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('UI Design'),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => HomeUIDesign());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuUIStarbucks() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('startbucks'.tr),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => MainButtonMenu());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuProviders() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('providers'.tr),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => MainScreenProviders());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuGoogle() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('Google Map'.tr),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => GoogleMapUIHome());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showListMenuBMI() {
    return ListTile(
      leading: Icon(Icons.pets, size: 36.0, color: Colors.blue.shade600),
      title: Text('BMI'.tr),
      onTap: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => MainScreenBMI());
        Navigator.of(context).push(materialPageRoute);
        // Navigator.of(context).pop();
      },
    );
  }

  Widget showName(String username) {
    return Text(
      'Name Customer : $username',
      style: TextStyle(
          color: Colors.blue.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }

  Widget showImageProfile() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/dog.png'),
    );
  }

  Widget showHead(String username) {
    return DrawerHeader(
      child: Column(
        children: [
          showImageProfile(),
          SizedBox(
            height: 8.0,
          ),
          showName(username),
        ],
      ),
    );
  }

  Widget showDrawer(String username) {
    return Drawer(
        child: ListView(
      children: [
        showHead(username),
        showListMenuPets(),
        showListMenuSales(),
        showListMenuUI(),
        showListMenuUIStarbucks(),
        showListMenuProviders(),
        showListMenuGoogle(),
        showListMenuBMI(),
      ],
    ));
  }

  //End Method
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context).settings.arguments;
    showName(username);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text('Menu'),
        actions: [],
      ),
      //สร้าง Object ให้อยู่ใน View
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/PetBackground.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          //     //set วัตถุให้อยู่กึ่งกลาง
          child: Column(
            mainAxisSize: MainAxisSize.min, //ปรับวัตถให้อยู่กึ่งกลางหน้าจอ
            children: [],
          ),
        ),
      )),
      drawer: showDrawer(username),
      // end Column
    );
  }

  Widget menuPetsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(40 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
                      //image: NetworkImage(
                      //'https://pupuphooray.com/wp-content/uploads/2019/03/dog-icon.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("ระบบบันทึกข้อมูลสัตว์เลี้ยง"),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          //child: Text('Edit'),
                          onPressed: () async {
                            var materialPageRoute = MaterialPageRoute(
                                builder: (context) => PetControler());
                            Navigator.push(context, materialPageRoute);
                          },
                          child: null,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuSalesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    //color: Colors.blue.shade400,
                    //image: DecorationImage(image: photo),
                    borderRadius: BorderRadius.circular(40 / 2),
                    // ignore: missing_required_param
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/dog.png'),
                      //image: NetworkImage(
                      //'https://pupuphooray.com/wp-content/uploads/2019/03/dog-icon.png'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text("ระบบขายสินค้า"),
                    ),
                    ButtonBar(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          //child: Text('Edit'),
                          onPressed: () async {
                            print('object');
                            var materialPageRoute = MaterialPageRoute(
                                builder: (context) => PetControler());
                            Navigator.push(context, materialPageRoute);
                          },
                          child: null,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
