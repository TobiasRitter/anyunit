import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteConnector {
  static Future<Database> loadDB(String dbName) async {
    var databasesPath = await getDatabasesPath();
    String completePath = join(databasesPath, dbName, ".db");

    return await openDatabase(
      completePath,
      version: 1,
      onCreate: (Database db, int version) async {},
    );
  }

  static Future<bool> exists(Database database, String tableName) async {
    List<Map<String, dynamic>> result = await select(
      database,
      "sqlite_master",
      columns: ["count(*)"],
      where: "type=? AND name=?",
      whereArgs: ["table", tableName],
    );
    return (result != null && result.length > 0);
  }

  static Future create(
    Database database,
    String tableName,
    String attributes,
  ) async {
    database.execute(
      "create table if not exists $tableName($attributes)",
    );
  }

  static Future<int> insert(
    Database database,
    String tableName,
    Map<String, dynamic> values,
  ) async {
    try {
      return database.insert(
        tableName,
        values,
      );
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Map<String, dynamic>>> select(
    Database database,
    String tableName, {
    bool distinct,
    List<String> columns,
    String where,
    List whereArgs,
    String groupBy,
    String orderBy,
  }) async {
    return database.query(
      tableName,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      orderBy: orderBy,
    );
  }

  static Future<int> update(
    Database database,
    String tableName,
    Map<String, dynamic> values, {
    String where,
    List whereArgs,
  }) async {
    return database.update(
      tableName,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  static Future<int> delete(
    Database database,
    String tableName, {
    String where,
    List whereArgs,
  }) async {
    return database.delete(
      tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  static Future drop(
    Database database,
    String tableName,
  ) async {
    database.execute(
      "drop table if exists $tableName",
    );
  }
}
