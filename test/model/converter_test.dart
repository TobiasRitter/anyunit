import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/converter.dart';
import 'package:cleverconvert/model/unit.dart';
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

    Map<String, String> conversionResults = tempConverter.convert(20);
    expect(conversionResults.length, 1);
    expect(conversionResults.containsValue("68.0"), true);
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

    Map conversionResults = tempConverter.convert(20);
    expect(conversionResults.length, 0);
  });

  test("categories has to contain at least one category", () {
    expect(
        () => Converter(categories: {}),
        throwsA(predicate((e) =>
            e is ArgumentError &&
            e.message == "at least one category needed")));
  });

  test("unknown category cannot be selected", () {
    Unit celcius = Unit(
        name: "celcius",
        getConvertedValue: (val) => val - 273.15,
        getStandardizedValue: (val) => val + 273.15);

    Category temperature = Category(
      name: "temperature",
      units: {
        celcius,
      },
    );

    Converter converter = Converter(
      categories: {
        temperature,
      },
    );

    expect(
        () => converter.selectedCategory =
            Category(name: "unknown", units: {celcius}),
        throwsA(predicate(
            (e) => e is ArgumentError && e.message == "unknown category")));
  });

  test("selected unit has to be in selected category", () {
    Unit celcius = Unit(
        name: "celcius",
        getConvertedValue: (val) => val - 273.15,
        getStandardizedValue: (val) => val + 273.15);

    Category temperature = Category(
      name: "temperature",
      units: {
        celcius,
      },
    );

    Converter converter = Converter(
      categories: {
        temperature,
      },
    );

    expect(
        () => converter.selectedUnit = Unit(
            name: "unknown",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val),
        throwsA(predicate((e) =>
            e is ArgumentError &&
            e.message == "unit is not in the selected category")));
  });
}
