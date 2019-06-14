import 'package:anyunit/model/unit.dart';

class Converter {
  /// set of all known units
  final Set<Unit> availableUnits = Set();

  /// returns a map of unit names with their converted values
  Map convert(
      Unit originalUnit, double originalValue, Set<Unit> availableUnits) {
    Map results = Map();
    // use the standardized value for the calculation
    double standardizedValue = originalUnit.getStandardizedValue(originalValue);
    for (Unit unit in availableUnits) {
      // if the unit is in the same category as the original unit, add the converted value to the results
      if (unit.standardUnit == originalUnit.standardUnit) {
        results[unit.name] = unit.getConvertedValue(standardizedValue);
      }
    }
    return results;
  }
}
