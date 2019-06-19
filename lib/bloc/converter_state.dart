import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConverterState extends Equatable {
  ConverterState(this.value, this.unit, [List props = const []]) : super(props);

  final String value;
  final String unit;
}

class InputState extends ConverterState {
  final int categoryIndex;
  final Set<String> categories;
  final Set<String> units;

  InputState({
    @required this.categoryIndex,
    @required this.categories,
    @required String unit,
    @required this.units,
    @required String value,
  }) : super(value, unit);

  factory InputState.initial({
    @required Set<String> categories,
    @required Set<String> units,
  }) {
    return InputState(
      value: "0.0",
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

class LoadingState extends ConverterState {
  LoadingState({
    @required String value,
    @required String unit,
  }) : super(value, unit);
}

class ResultState extends ConverterState {
  final Map<String, String> results;

  ResultState({
    @required String value,
    @required String unit,
    @required this.results,
  }) : super(value, unit);
}
