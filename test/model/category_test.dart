import 'package:cleverconvert/model/category.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("category name cannot be empty", () {
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
