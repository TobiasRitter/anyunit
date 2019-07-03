import 'package:cleverconvert/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("unit with same name are considered equal", () {
    Unit unit1 = Unit(
      name: "a",
      getConvertedValue: (val) => val * 2,
      getStandardizedValue: (val) => val / 2,
    );
    Unit unit2 = Unit(
      name: "a",
      getConvertedValue: (val) => val * 3,
      getStandardizedValue: (val) => val / 3,
    );
    expect(unit1 == unit2, true);
  });

  test("unit name cannot be null", () {
    expect(
      () => Unit(
            name: null,
            getConvertedValue: null,
            getStandardizedValue: null,
          ),
      throwsA(
        predicate(
          (e) => e is ArgumentError && e.message == "unit name is needed",
        ),
      ),
    );
    expect(
      () => Unit(
            name: "",
            getConvertedValue: null,
            getStandardizedValue: null,
          ),
      throwsA(
        predicate(
          (e) => e is ArgumentError && e.message == "unit name is needed",
        ),
      ),
    );
  });

  test("conversion function cannot be null", () {
    expect(
      () => Unit(
            name: "unit",
            getConvertedValue: null,
            getStandardizedValue: null,
          ),
      throwsA(
        predicate(
          (e) =>
              e is ArgumentError &&
              e.message == "conversion function cannot be null",
        ),
      ),
    );
  });

  test("standardization function cannot be null", () {
    expect(
      () => Unit(
            name: "unit",
            getConvertedValue: (val) => val,
            getStandardizedValue: null,
          ),
      throwsA(
        predicate(
          (e) =>
              e is ArgumentError &&
              e.message == "standardization function cannot be null",
        ),
      ),
    );
  });
}
