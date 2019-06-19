import 'package:anyunit/model/category.dart';
import 'package:test_api/test_api.dart';

void main() {
  test("units has to contain at least one category", () {
    expect(
        () => Category(
              name: "empty category",
              units: {},
            ),
        throwsA(predicate((e) =>
            e is ArgumentError && e.message == "at least one unit needed")));
  });
}
