import 'package:cleverconvert/model/unit.dart';
import 'package:meta/meta.dart';

/// a basic conversion between two units
class Conversion {
  /// method for converting a value from one unit into another
  static double convert({
    @required Unit originalUnit,
    @required Unit targetUnit,
    @required double originalValue,
  }) {
    // get the standardized value first
    double standardizedValue = originalUnit.getStandardizedValue(originalValue);
    // then convert it to the target unit
    return targetUnit.getConvertedValue(standardizedValue);
  }
}
