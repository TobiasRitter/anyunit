import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/converter.dart';
import 'package:anyunit/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("conversion from celcius to fahrenheit is working", () {
    Unit celcius = Unit(
        name: "celcius",
        getConvertedValue: (val) => val - 273.15,
        getStandardizedValue: (val) => val + 273.15);
    Unit fahrenheit = Unit(
        name: "fahrenheit",
        getConvertedValue: (val) => (val - 273.15) * 9 / 5 + 32,
        getStandardizedValue: (val) => (val - 32) * 5 / 9 + 273.15);

    Category temperatures = Category(
      name: "temperatures",
      units: {
        celcius,
        fahrenheit,
      },
    );

    Converter tempConverter = Converter(
      categories: {temperatures},
    );

    Map conversionResults = tempConverter
        .convert(originalUnit: celcius, originalValue: 20, availableUnits: {
      celcius,
      fahrenheit,
    });
    expect(conversionResults.length, 1);
    expect(conversionResults.containsValue(68.0), true);
  });

  test("equal unit is not shown as a result", () {
    Unit celcius = Unit(
        name: "celcius",
        getConvertedValue: (val) => val - 273.15,
        getStandardizedValue: (val) => val + 273.15);
    Unit celciusCopy = Unit(
        name: "celcius",
        getConvertedValue: (val) => val - 273.15,
        getStandardizedValue: (val) => val + 273.15);

    Category temperatures = Category(
      name: "temperatures",
      units: {
        celcius,
        celciusCopy,
      },
    );

    Converter tempConverter = Converter(
      categories: {temperatures},
    );

    Map conversionResults = tempConverter
        .convert(originalUnit: celcius, originalValue: 20, availableUnits: {
      celcius,
      celciusCopy,
    });
    expect(conversionResults.length, 0);
  });
}
