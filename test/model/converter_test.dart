import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/converter.dart';
import 'package:cleverconvert/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("only categories loaded from the database can be selected", () {
    Category newCategory = Category(
      name: "new",
      units: <Unit>{
        Unit(
          name: "unit",
          getStandardizedValue: (val) => val,
          getConvertedValue: (val) => val,
        )
      },
    );
    expect(
      () => Converter.selectedCategory = newCategory,
      throwsA(
        predicate(
          (e) => e is ArgumentError && e.message == "unknown category",
        ),
      ),
    );
  });

  test("value has to be valid int or double", () {
    Converter.value = "abc";
    expect(Converter.validValue, false);
    expect(
      () => Converter.convert(),
      throwsA(
        predicate(
          (e) =>
              e is ArgumentError &&
              e.message == "value is no valid int or double",
        ),
      ),
    );
  });

  test("selected unit has to be in the selected category", () {
    Unit validUnit = Converter.selectedCategory.units.first;
    Unit invalidUnit = Unit(
      name: "invalid",
      getConvertedValue: (val) => val,
      getStandardizedValue: (val) => val,
    );

    Converter.selectedUnit = validUnit;

    expect(
      () => Converter.selectedUnit = invalidUnit,
      throwsA(
        predicate(
          (e) =>
              e is ArgumentError &&
              e.message == "unit is not in the selected category",
        ),
      ),
    );
  });
}
