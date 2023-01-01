import 'package:tubes_provis/Model/HistoryModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

class DbHelperHistory {
  static Database? _db;

  static const String DB_Name = 'bmiexpert.db';
  static const String Table_History = 'history';
  static const int Version = 1;

  static const String C_HistoryID = 'history_id';
  static const String C_UserID = 'user_id';
  static const String C_Date = 'date';
  static const String C_bmi = 'bmi';
  static const String C_ResultCategory = 'resultCategory';



  Future<Database> get db async =>
      _db ??= await initDb();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }


  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_History ("
        " $C_UserID TEXT, "
        " $C_Date TEXT, "
        " $C_bmi TEXT,"
        " $C_ResultCategory TEXT, "
        ")");
  }

  Future<int> saveData(HistoryModel history) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_History, history.toMap());
    return res;
  }

  Future<HistoryModel?> getHistoryUser(String userId, String date) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_History WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Date = '$date'");

    if (res.length > 0) {
      return HistoryModel.fromMap(res.first);
    }
    return null;
  }



  Future<int> updateHistory(HistoryModel history) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_History, history.toMap(),
        where: '$C_UserID = ? AND $C_Date = ?', whereArgs: [history.user_id, history.date]);
    return res;

  }

  Future<List<Map<String, dynamic>>> select(String userId) async {
    var dbClient = await db;
    var mapList = await dbClient.rawQuery("SELECT * FROM $Table_History WHERE "
        "$C_UserID = '$userId'");
    return mapList;
  }

  Future<List<HistoryModel>> getHistoryList(String userId) async {
    var historyMapList = await select(userId);
    int count = historyMapList.length;

    List<HistoryModel> historyList = <HistoryModel>[];

    for (int i=0; i<count; i++) {
      historyList.add(HistoryModel.fromMap(historyMapList[i]));
    }
    return historyList;
  }


}
