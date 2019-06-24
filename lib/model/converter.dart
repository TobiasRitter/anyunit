import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/unit.dart';

/// a basic unit converter
class Converter {
  /// set of all known unit categories
  static final Set<Category> _categories = <Category>{
    Category(
      name: "Weight",
      units: <Unit>{
        Unit(
          name: "g",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
        Unit(
          name: "kg",
          getConvertedValue: (val) => val / 1000,
          getStandardizedValue: (val) => val * 1000,
        ),
        Unit(
          name: "lbs",
          getConvertedValue: (val) => val / 453.592,
          getStandardizedValue: (val) => val * 453.592,
        ),
      },
    ),
    Category(
      name: "Temperature",
      units: <Unit>{
        Unit(
          name: "kelvin",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
        Unit(
          name: "celcius",
          getConvertedValue: (val) => val - 273.15,
          getStandardizedValue: (val) => val + 273.15,
        ),
        Unit(
          name: "fahrenheit",
          getConvertedValue: (val) => (val - 273.15) * 9 / 5 + 32,
          getStandardizedValue: (val) => (val - 32) * 5 / 9 + 273.15,
        ),
      },
    ),
    Category(
      name: "Distance",
      units: <Unit>{
        Unit(
          name: "m",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
        Unit(
          name: "cm",
          getConvertedValue: (val) => val * 100,
          getStandardizedValue: (val) => val / 100,
        ),
        Unit(
          name: "km",
          getConvertedValue: (val) => val / 1000,
          getStandardizedValue: (val) => val * 1000,
        ),
        Unit(
          name: "mile",
          getConvertedValue: (val) => val / 1609.344,
          getStandardizedValue: (val) => val * 1609.344,
        ),
        Unit(
          name: "in",
          getConvertedValue: (val) => val * 39.37,
          getStandardizedValue: (val) => val / 39.37,
        ),
        Unit(
          name: "ft",
          getConvertedValue: (val) => val * 3.281,
          getStandardizedValue: (val) => val / 3.281,
        ),
        Unit(
          name: "yard",
          getConvertedValue: (val) => val * 1.094,
          getStandardizedValue: (val) => val / 1.094,
        ),
      },
    ),
    Category(
      name: "Speed",
      units: <Unit>{
        Unit(
          name: "m/s",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
        Unit(
          name: "kmh",
          getConvertedValue: (val) => val * 3.6,
          getStandardizedValue: (val) => val / 3.6,
        ),
      },
    ),
  };

  static Set<Category> get categories => _categories;

  /// the currently selected category
  static Category _selectedCategory = _categories.elementAt(0);

  /// the currently selected unit
  static Unit _selectedUnit = selectedCategory.units.elementAt(0);

  static double value;

  static Category get selectedCategory => _selectedCategory;

  static set selectedCategory(Category category) {
    if (!_categories.contains(category)) {
      throw ArgumentError("unknown category");
    }
    _selectedCategory = category;
    _selectedUnit = _selectedCategory.units.elementAt(0);
  }

  static Unit get selectedUnit => _selectedUnit;

  static set selectedUnit(Unit unit) {
    if (!_selectedCategory.units.contains(unit)) {
      throw ArgumentError("unit is not in the selected category");
    }
    _selectedUnit = unit;
  }

  /// returns a map of unit names with their converted values
  static Map<String, String> convert() {
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
