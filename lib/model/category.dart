import 'package:anyunit/model/unit.dart';

class Category {
  /// name of the unit category
  final String name;

  /// all units in this category
  final Set<Unit> units;

  Category(
    this.name,
    this.units,
  );
}
