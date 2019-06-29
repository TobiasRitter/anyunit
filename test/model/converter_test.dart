import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/converter.dart';
import 'package:cleverconvert/model/unit.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("Only categories loaded from the database can be selected", () {
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
        throwsA(predicate(
            (e) => e is ArgumentError && e.message == "unknown category")));
  });
}
