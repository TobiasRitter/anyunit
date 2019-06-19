import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/unit.dart';
import 'package:meta/meta.dart';

/// a basic unit converter
class Converter {
  /// set of all known unit categories
  final Set<Category> categories;

  /// the currently selected category
  Category selectedCategory;

  /// the currently selected unit
  Unit selectedUnit;

  /// creates a new converter with the given categories
  Converter({
    @required this.categories,
  }) {
    // check that categories is not empty
    if (categories.length == 0) {
      throw ArgumentError("at least one category needed");
    }
    // select the first category by default
    selectedCategory = categories.elementAt(0);

    // select the first unit by default
    selectedUnit = selectedCategory.units.elementAt(0);
  }

  /// returns a map of unit names with their converted values
  Map<String, String> convert({
    @required dynamic originalValue,
  }) {
    // check if the original unit is valid
    if (!selectedCategory.units.contains(selectedUnit)) {
      throw ArgumentError("unit is not in the selected category");
    }

    // try to convert the given value into a double
    if (originalValue is! int && originalValue is! double) {
      throw ArgumentError("value is no valid int or double");
    }

    Map<String, String> results = Map();
    // use the standardized value for the calculation
    dynamic standardizedValue =
        selectedUnit.getStandardizedValue(originalValue.toDouble());

    for (Unit unit in selectedCategory.units) {
      // convert into all units of the same category
      if (unit != selectedUnit) {
        results[unit.name] =
            unit.getConvertedValue(standardizedValue).toString();
      }
    }
    return results;
  }
}
