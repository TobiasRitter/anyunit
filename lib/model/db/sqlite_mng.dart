import 'dart:async';
import 'package:anyunit/model/db/sqlite_connector.dart';
import 'package:anyunit/model/db/sqlite_entity.dart';
import 'package:sqflite/sqflite.dart';

class SqliteMng {
  String _databaseName;
  Database _database;

  SqliteMng({String databaseName}) {
    _databaseName = databaseName == null ? "db" : databaseName;
  }

  Future checkDB(SqliteEntity storable) async {
    if (_database == null)
      _database = await SqliteConnector.loadDB(_databaseName);
    await SqliteConnector.create(
      _database,
      storable.tableName,
      storable.tableDefinition(),
    );
  }

  Future<Set<SqliteEntity>> loadItemsOfType(Function constructor) async {
    SqliteEntity storable = constructor();
    await checkDB(storable);

    List<Map<String, dynamic>> dbOutput =
        await SqliteConnector.select(_database, storable.tableName);

    Set<SqliteEntity> output = Set();
    for (Map<String, dynamic> map in dbOutput) {
      SqliteEntity loadedItem = constructor();
      loadedItem.fromMap(map);
      output.add(loadedItem);
    }
    return output;
  }

  void saveTableItem(
    SqliteEntity item,
  ) async {
    await checkDB(item);
    try {
      SqliteConnector.insert(_database, item.tableName, item.toMap());
    } catch (e) {
      throw e;
    }
  }

  void updateTableItem(
    SqliteEntity item,
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
    SqliteEntity item,
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
