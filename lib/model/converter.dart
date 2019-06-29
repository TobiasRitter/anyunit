import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/dbms.dart';
import 'package:cleverconvert/model/unit.dart';

/// a basic unit converter
class Converter {
  /// load categories from db
  static final Set<Category> _categories = DBMS.load();

  /// returns the categories available for the converter
  static Set<Category> get categories => _categories;

  /// the currently selected category
  static Category _selectedCategory = _categories.elementAt(0);

  /// the currently selected unit
  static Unit _selectedUnit = selectedCategory.units.elementAt(0);

  /// the value currently set for conversion
  static String value = "";

  /// returns if the currently set value is a valid double
  static bool get validValue {
    return double.tryParse(value) != null;
  }

  /// get the currently selected category
  static Category get selectedCategory => _selectedCategory;

  /// selects a category out of the given set of categories
  static set selectedCategory(Category category) {
    if (!_categories.contains(category)) {
      throw ArgumentError("unknown category");
    }
    _selectedCategory = category;
    _selectedUnit = _selectedCategory.units.elementAt(0);
  }

  /// get the currently selected unit
  static Unit get selectedUnit => _selectedUnit;

  /// selects a unit out of the selected category
  static set selectedUnit(Unit unit) {
    if (!_selectedCategory.units.contains(unit)) {
      throw ArgumentError("unit is not in the selected category");
    }
    _selectedUnit = unit;
  }

  /// returns a map of unit names with their converted values
  static Map<String, String> convert() {
    if (!validValue) {
      throw ArgumentError("value is no valid int or double");
    }

    // try to convert the given value into a double
    double parsedValue = double.tryParse(value);

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
