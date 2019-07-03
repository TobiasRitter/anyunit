import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("category name cannot be empty", () {
    Category(
      name: "valid",
      units: <Unit>{
        Unit(
          name: "unit",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
      },
    );
    expect(
        () => Category(
              name: null,
              units: null,
            ),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "category name is needed")));
    expect(
        () => Category(
              name: "",
              units: null,
            ),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "category name is needed")));
  });
  test("units has to contain at least one category", () {
    Category(
      name: "valid",
      units: <Unit>{
        Unit(
          name: "unit",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
      },
    );
    expect(
        () => Category(
              name: "empty category",
              units: null,
            ),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "at least one unit needed")));
    expect(
        () => Category(
              name: "empty category",
              units: {},
            ),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "at least one unit needed")));
  });
}
