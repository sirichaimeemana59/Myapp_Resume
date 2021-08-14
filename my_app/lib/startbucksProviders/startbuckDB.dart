import 'dart:io';

import 'package:my_app/startbucksProviders/cardModelProvider.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class StartbucksDB {
  String dbName;

  StartbucksDB({this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();

    String dbPath = join(appDirectory.path, dbName);

    DatabaseFactory dbFactory = await databaseFactoryIo;

    Database db = await dbFactory.openDatabase(dbPath);

    return db;
  }

  Future<int> InsertData(CardModersStarbucks statement) async {
    //สร้าง Store
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("startbucks");

    //Insert data format Json
    var keyID = store.add(
      db,
      {
        "cardNumber": statement.cardNumber,
        "verifyCard": statement.verifyCard,
        "date": statement.date.toIso8601String(),
      },
    );
    //print(keyID);
    db.close();
    return keyID;
  }

  Future<List<CardModersStarbucks>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("startbucks");

    var snapshotData = await store.find(
      db,
      finder: Finder(
        sortOrders: [
          SortOrder(Field.key,
              false), //เรียงข้อมูลจาก Key เรียงจากวันที่สร้างล่าสุดก่อนคือ False True คือ เรียงจากวันที่สร้างเก่าสุดก่อน
        ],
      ),
    );

    // ignore: deprecated_member_use
    List cardStarbucksList = List<CardModersStarbucks>();
    for (var record in snapshotData) {
      // Loop Data to list
      cardStarbucksList.add(
        CardModersStarbucks(
          cardNumber: record["cardNumber"],
          verifyCard: record["verifyCard"],
          date: DateTime.parse(record["date"]),
        ),
      );
    }
    return cardStarbucksList;
  }
}
