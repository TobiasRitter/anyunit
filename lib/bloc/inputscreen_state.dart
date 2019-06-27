import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class InputScreenState extends Equatable {
  final String value;
  final String unit;
  final int categoryIndex;
  final Set<String> categories;
  final Set<String> units;
  final bool convertPossible;

  InputScreenState({
    @required this.unit,
    @required this.value,
    @required this.categoryIndex,
    @required this.categories,
    @required this.units,
    @required this.convertPossible,
  }) : super([categoryIndex, categories, unit, units, value]);

  factory InputScreenState.initial({
    @required Set<String> categories,
    @required Set<String> units,
  }) {
    return InputScreenState(
      value: "0",
      categoryIndex: 0,
      categories: categories,
      unit: units.elementAt(0),
      units: units,
      convertPossible: false,
    );
  }

  InputScreenState copyWith({
    int categoryIndex,
    Set<String> categories,
    String unit,
    Set<String> units,
    String value,
    bool convertPossible,
  }) {
    return InputScreenState(
      value: value ?? this.value,
      unit: unit ?? this.unit,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      units: units ?? this.units,
      categories: categories ?? this.categories,
      convertPossible: convertPossible ?? this.convertPossible,
    );
  }
}
