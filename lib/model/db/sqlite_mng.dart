import 'dart:async';
import 'package:anyunit/model/db/sqlite_connector.dart';
import 'package:anyunit/model/db/sqlite_storable.dart';
import 'package:sqflite/sqflite.dart';

class SqliteMng {
  String _databaseName;
  Database _database;

  SqliteMng({String databaseName}) {
    _databaseName = databaseName == null ? "db" : databaseName;
  }

  Future checkDB(SqliteStorable storable) async {
    if (_database == null)
      _database = await SqliteConnector.loadDB(_databaseName);
    await SqliteConnector.create(
      _database,
      storable.tableName,
      storable.tableDefinition(),
    );
  }

  Future<Set<SqliteStorable>> loadItemsOfType(Function constructor) async {
    SqliteStorable storable = constructor();
    await checkDB(storable);

    List<Map<String, dynamic>> dbOutput =
        await SqliteConnector.select(_database, storable.tableName);

    Set<SqliteStorable> output = Set();
    for (Map<String, dynamic> map in dbOutput) {
      SqliteStorable loadedItem = constructor();
      loadedItem.fromMap(map);
      output.add(loadedItem);
    }
    return output;
  }

  void saveTableItem(
    SqliteStorable item,
  ) async {
    await checkDB(item);
    try {
      SqliteConnector.insert(_database, item.tableName, item.toMap());
    } catch (e) {
      throw e;
    }
  }

  void updateTableItem(
    SqliteStorable item,
    String where,
  ) async {
    await checkDB(item);
    try {
      SqliteConnector.update(_database, item.tableName, item.toMap(),
          where: where);
    } catch (e) {
      throw e;
    }
  }

  void deleteTableItem(
    SqliteStorable item,
    String where,
  ) async {
    await checkDB(item);
    try {
      SqliteConnector.delete(
        _database,
        item.tableName,
        where: where,
      );
    } catch (e) {
      throw e;
    }
  }
}
