import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ResultsScreenState extends Equatable {
  final String value;
  final String unit;
  final Map<String, String> results;

  ResultsScreenState({
    @required this.value,
    @required this.unit,
    @required this.results,
  }) : super([value, unit, results]);
}
