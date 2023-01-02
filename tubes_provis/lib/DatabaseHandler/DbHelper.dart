import 'package:tubes_provis/Model/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

import '../Model/HistoryModel.dart';

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'bmi_expert.db';
  static const int Version = 1;

  static const String Table_User = 'user';
  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';

  static const String Table_History = 'history';
  static const String C_HistoryID = 'history_id';
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

  // create table user and history
  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT, "
        " $C_UserName TEXT, "
        " $C_Email TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
    await db.execute("CREATE TABLE $Table_History ("
        "$C_HistoryID INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$C_UserID TEXT,"
        "$C_Date TEXT,"
        "$C_bmi REAL,"
        "$C_ResultCategory TEXT"
        ")");
  }

  // for insert new user to table user
  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  // check if user exist on table or not
  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  // to update data user
  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toMap(),
        where: '$C_UserID = ?', whereArgs: [user.user_id]);
    return res;
  }

  // to delete data user
  Future<int> deleteUser(String user_id) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(Table_User, where: '$C_UserID = ?', whereArgs: [user_id]);
    return res;
  }


  // insert new data history to table history
  Future<int> insertDataHistory(HistoryModel history) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_History, history.toMap());
    return res;
  }

  // check if user have history with current date
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


  // to update history with new data
  Future<int> updateHistory(HistoryModel history) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_History, history.toMap(),
        where: '$C_UserID = ? AND $C_Date = ?', whereArgs: [history.user_id, history.date]);
    return res;

  }

  // select history user to get list of history
  Future<List<Map<String, dynamic>>> select(String userId) async {
    var dbClient = await db;
    var mapList = await dbClient.rawQuery("SELECT * FROM $Table_History WHERE "
        "$C_UserID = '$userId' ORDER BY date ASC");
    return mapList;
  }

  // get history user
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
