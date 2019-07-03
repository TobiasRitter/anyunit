import 'package:meta/meta.dart';

/// object representing a unit
class Unit {
  /// the name of the unit
  final String name;

  /// converts a value of the standard unit into a value of the current unit
  final Function(
    double referenceUnitValue,
  ) getConvertedValue;

  /// converts a value of the current unit into a value of the standard unit
  final Function(
    double referenceUnitValue,
  ) getStandardizedValue;

  /// creates a new unit with the given name and conversion functions
  Unit({
    @required this.name,
    @required this.getConvertedValue,
    @required this.getStandardizedValue,
  }) {
    // check that name is not empty
    if (name == null || name == "") {
      throw ArgumentError("unit name is needed");
    }
    // check that conversion function is not null
    if (getConvertedValue == null) {
      throw ArgumentError("conversion function cannot be null");
    }
    // check that standardization function is not null
    if (getStandardizedValue == null) {
      throw ArgumentError("standardization function cannot be null");
    }
  }

  /// equals operator is comparing the name attributes
  bool operator ==(o) => o is Unit && o.name == this.name;

  /// returns hash code depending on the name attribute
  int get hashCode => name.hashCode;
}
