import 'package:cleverconvert/model/unit.dart';
import 'package:meta/meta.dart';

/// object containing a group of units of the same type
class Category {
  /// name of the unit category
  final String name;

  /// all units in this category
  final Set<Unit> units;

  /// creates a new category with given name and units
  Category({
    @required this.name,
    @required this.units,
  }) {
    // check that the name is not empty
    if (name == null || name == "") {
      throw ArgumentError("category name is needed");
    }
    // check that units is not empty
    if (units == null || units.length == 0) {
      throw ArgumentError("at least one unit needed");
    }
  }
}
