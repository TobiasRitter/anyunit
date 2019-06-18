import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConverterState extends Equatable {
  ConverterState([List props = const []]) : super(props);
}

class InputState extends ConverterState {
  final double value;
  final int category;
  final int unit;

  InputState({
    @required this.value,
    @required this.category,
    @required this.unit,
  });

  factory InputState.initial() {
    return InputState(
      value: 0.0,
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

class LoadingState extends ConverterState {}

class ResultState extends ConverterState {
  final Map<String, dynamic> results;

  ResultState({
    @required this.results,
  });
}
