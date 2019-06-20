import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/unit.dart';
import 'package:meta/meta.dart';

/// a basic unit converter
class Converter {
  /// set of all known unit categories
  final Set<Category> categories;

  /// the currently selected category
  Category _selectedCategory;

  /// the currently selected unit
  Unit _selectedUnit;

  double value = 0;

  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category category) {
    if (!categories.contains(category)) {
      throw ArgumentError("unknown category");
    }
    _selectedCategory = category;
    _selectedUnit = _selectedCategory.units.elementAt(0);
  }

  Unit get selectedUnit => _selectedUnit;

  set selectedUnit(Unit unit) {
    if (!_selectedCategory.units.contains(unit)) {
      throw ArgumentError("unit is not in the selected category");
    }
    _selectedUnit = unit;
  }

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
  Map<String, String> convert() {
    // try to convert the given value into a double
    double parsedValue = double.tryParse(value.toString());
    if (parsedValue == null) {
      throw ArgumentError("value is no valid int or double");
    }

    Map<String, String> results = Map();
    // use the standardized value for the calculation
    dynamic standardizedValue = selectedUnit.getStandardizedValue(parsedValue);

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
