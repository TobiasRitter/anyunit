import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConverterState extends Equatable {
  ConverterState(this.value, this.category, this.unit, [List props = const []])
      : super(props);

  final String value;
  final int category;
  final int unit;
}

class InputState extends ConverterState {
  InputState({
    @required String value,
    @required int category,
    @required int unit,
  }) : super(value, category, unit);

  factory InputState.initial() {
    return InputState(
      value: "0.0",
      category: 0,
      unit: 0,
    );
  }

  InputState copyWith({
    double value,
    int category,
    int unit,
  }) {
    return InputState(
      value: value ?? this.value,
      category: category ?? this.category,
      unit: unit ?? this.unit,
    );
  }
}

class LoadingState extends ConverterState {
  LoadingState({
    @required String value,
    @required int category,
    @required int unit,
  }) : super(value, category, unit);
}

class ResultState extends ConverterState {
  final Map<String, dynamic> results;

  ResultState({
    @required String value,
    @required int category,
    @required int unit,
    @required this.results,
  }) : super(value, category, unit);
}
