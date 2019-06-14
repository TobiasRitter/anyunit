import 'package:anyunit/model/db/sqlite_attribute.dart';
import 'package:anyunit/model/db/sqlite_entity.dart';

class Unit extends SqliteEntity {
  /// the name of the unit
  final String name;

  /// the standard unit used for the calculations
  ///
  /// important for checking the category of a unit
  final Unit standardUnit;

  /// converts a value of the standard unit into a value of the current unit
  final Function(double referenceUnitValue) getConvertedValue;

  /// converts a value of the current unit into a value of the standard unit
  final Function(double referenceUnitValue) getStandardizedValue;

  Unit(this.name, this.standardUnit, this.getConvertedValue,
      this.getStandardizedValue);

  @override
  // TODO: implement attributes
  Set<SqliteAttribute> get attributes => null;

  @override
  // TODO: implement tableName
  String get tableName => null;
}
