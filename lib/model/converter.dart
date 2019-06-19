import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/unit.dart';
import 'package:meta/meta.dart';

/// a basic unit converter
class Converter {
  /// set of all known unit categories
  final Set<Category> categories;

  /// creates a new converter with the given categories
  Converter({
    @required this.categories,
  });

  /// returns a map of unit names with their converted values
  Map convert({
    @required Unit originalUnit,
    @required double originalValue,
    @required Category category,
  }) {
    // check if the original unit is valid
    if (!category.units.contains(originalUnit)) {
      throw ArgumentError("unit is not in the selected category");
    }

    Map results = Map();
    // use the standardized value for the calculation
    double standardizedValue = originalUnit.getStandardizedValue(originalValue);

    for (Unit unit in category.units) {
      // convert into all units of the same category
      if (unit != originalUnit) {
        results[unit.name] = unit.getConvertedValue(standardizedValue);
      }
    }
    return results;
  }
}
