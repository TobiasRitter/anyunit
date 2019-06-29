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
}
