import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/converter.dart';
import 'package:anyunit/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("convert from celcius to fahrenheit", () {
    Unit celcius =
        Unit("celcius", (val) => val - 273.15, (val) => val + 273.15);
    Unit fahrenheit = Unit("fahrenheit", (val) => (val - 273.15) * 9 / 5 + 32,
        (val) => (val - 32) * 5 / 9 + 273.15);

    Category temperatures = Category(
      "temperatures",
      {
        celcius,
        fahrenheit,
      },
    );

    Converter tempConverter = Converter(
      {temperatures},
    );

    Map conversionResults = tempConverter.convert(celcius, 20, {
      celcius,
      fahrenheit,
    });
    expect(conversionResults.length, 1);
    expect(conversionResults.containsValue(68.0), true);
  });
}
