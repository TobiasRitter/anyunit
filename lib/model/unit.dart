import 'package:quiver/core.dart';

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
  Unit(
    this.name,
    this.getConvertedValue,
    this.getStandardizedValue,
  );

  /// equals operator is comparing the name attributes
  bool operator ==(o) => o is Unit && o.name == this.name;

  /// returns hash code depending on the name attribute
  int get hashCode => name.hashCode;
}
