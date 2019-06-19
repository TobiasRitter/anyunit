import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/unit.dart';
import 'package:meta/meta.dart';

/// a basic unit converter
class Converter {
  /// set of all known unit categories
  final Set<Category> categories;

  /// the currently selected category
  Category selectedCategory;

  /// creates a new converter with the given categories
  Converter({
    @required this.categories,
  }) {
    // check that categories is not empty
    if (categories.length == 0) {
      throw ArgumentError("at least one category needed");
    }
    //select the first category by default
    selectedCategory = categories.elementAt(0);
  }

  /// returns a map of unit names with their converted values
  Map convert({
    @required Unit originalUnit,
    @required double originalValue,
  }) {
    // check if the original unit is valid
    if (!selectedCategory.units.contains(originalUnit)) {
      throw ArgumentError("unit is not in the selected category");
    }

    Map results = Map();
    // use the standardized value for the calculation
    double standardizedValue = originalUnit.getStandardizedValue(originalValue);

    for (Unit unit in selectedCategory.units) {
      // convert into all units of the same category
      if (unit != originalUnit) {
        results[unit.name] = unit.getConvertedValue(standardizedValue);
      }
    }
    return results;
  }
}
