import 'package:cleverconvert/model/unit.dart';
import 'package:meta/meta.dart';

class Conversion {
  /// method for converting a value from one unit into another
  static double convert({
    @required Unit originalUnit,
    @required Unit targetUnit,
    @required double originalValue,
  }) {
    double standardizedValue = originalUnit.getStandardizedValue(originalValue);
    return targetUnit.getConvertedValue(standardizedValue);
  }
}
