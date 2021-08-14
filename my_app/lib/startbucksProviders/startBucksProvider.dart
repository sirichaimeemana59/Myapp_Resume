import 'package:flutter/foundation.dart';
import 'package:my_app/startbucksProviders/cardModelProvider.dart';
import 'package:my_app/startbucksProviders/startbuckDB.dart';

class StartBucksProviders with ChangeNotifier {
  List<CardModersStarbucks> cardStarbucksList = [];

  List<CardModersStarbucks> getCardModersStarbucks() {
    return cardStarbucksList;
  }

  void initData() async {
    var db = StartbucksDB(dbName: "startbucks.db");
    cardStarbucksList = await db.loadAllData();
    notifyListeners();
  }

  void addCardStarbucksList(CardModersStarbucks statement) async {
    //cardStarbucksList.add(statement);
    var db = StartbucksDB(dbName: "startbucks.db");
    await db.InsertData(statement);
    cardStarbucksList = await db.loadAllData();
    notifyListeners();
    //print(statement.cardNumber);
  }
}
