import 'package:anyunit/model/unit.dart';

/// object containing a group of units of the same type
class Category {
  /// name of the unit category
  final String name;

  /// all units in this category
  final Set<Unit> units;

  /// creates a new category with given name and units
  Category(
    this.name,
    this.units,
  );
}
