import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class InputState extends Equatable {
  final String value;
  final String unit;
  final int categoryIndex;
  final Set<String> categories;
  final Set<String> units;

  InputState({
    @required this.unit,
    @required this.value,
    @required this.categoryIndex,
    @required this.categories,
    @required this.units,
  }) : super([categoryIndex, categories, unit, units, value]);

  factory InputState.initial({
    @required Set<String> categories,
    @required Set<String> units,
  }) {
    return InputState(
      value: "0",
      categoryIndex: 0,
      categories: categories,
      unit: units.elementAt(0),
      units: units,
    );
  }

  InputState copyWith({
    int categoryIndex,
    Set<String> categories,
    String unit,
    Set<String> units,
    String value,
  }) {
    return InputState(
      value: value ?? this.value,
      unit: unit ?? this.unit,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      units: units ?? this.units,
      categories: categories ?? this.categories,
    );
  }
}

@immutable
class ResultsState extends Equatable {
  final String value;
  final String unit;
  final Map<String, String> results;

  ResultsState({
    @required this.value,
    @required this.unit,
    @required this.results,
  }) : super([value, unit, results]);
}
