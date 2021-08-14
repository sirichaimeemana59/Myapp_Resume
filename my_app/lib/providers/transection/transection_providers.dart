//Create Provider
import 'package:flutter/foundation.dart';
import 'package:my_app/database/transection_db.dart';
import 'package:my_app/modelProviders/model_providers.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

//ChangeNotifier แจ้งเตือนเมื่อมีการเปลี่ยนแปลงข้อมูล
class TransectionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transections> transections = [];

  //สร้าง function เพื่อให้บริการดึวข้อมูลไปใช้งาน
  //ส่งออกไปเป็น List
  List<Transections> getTransection() {
    return transections;
  }

  //ดึงข้อมูลเมื่อเริ้่มต้น App
  void initData() async {
    var db =
        TransectionDB(dbName: "transection.db"); //Call Funciton and create DB
    transections = await db.loadAllData(); //Query Data Before Insert Data
    notifyListeners(); //แจ้งเตือน  Consumenr เมื่อมีการเพิ่มข้อมูล
  }

  //สร้าง function เพื่อให้บริการเพิ่มข้อมูลไปใน List
  void addTransection(Transections statement) async {
    //Create database
    var db =
        TransectionDB(dbName: "transection.db"); //Call Funciton and create DB
    await db.InsertData(statement); //Save Data
    transections = await db.loadAllData(); //Query Data Before Insert Data
    //transections.insert(0, statement); //Insert data to list after index 0
    notifyListeners(); //แจ้งเตือน  Consumenr เมื่อมีการเพิ่มข้อมูล
  }

  void getData(var key) async {
    var db = TransectionDB(dbName: "transection.db");
    transections = await db.getData(key);
  }

  void deleteData(var key) async {
    var db = TransectionDB(dbName: "transection.db");
    transections = await db.deleteData(key);
    initData();
  }
}
