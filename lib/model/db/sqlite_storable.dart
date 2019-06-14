import 'package:anyunit/model/db/sqlite_attribute.dart';

abstract class SqliteStorable {
  String get tableName;
  Set<SqliteAttribute> get attributes;

  void fromMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      SqliteAttribute correspondingAttribute =
          attributes.firstWhere((attribute) => attribute.name == key);
      if (correspondingAttribute != null)
        correspondingAttribute.setValue(value);
    });
  }

  String tableDefinition() {
    String query = "";
    for (var i = 0; i < attributes.length; i++) {
      var attribute = attributes.elementAt(i);
      query += attribute.toString();
      if (i + 1 < attributes.length) query += ", ";
    }
    return query;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();
    for (var attribute in attributes) {
      map[attribute.name] = attribute.getValue();
    }
    return map;
  }
}
