import 'dart:async';
import 'package:cleverconvert/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

/// bloc for the results page
class ResultsScreenBloc extends Bloc<ResultsScreenEvent, ResultsScreenState> {
  final String value;
  final String unit;
  final Map<String, String> results;

  ResultsScreenBloc({
    @required this.value,
    @required this.unit,
    @required this.results,
  });

  @override
  ResultsScreenState get initialState =>
      ResultsScreenState(unit: unit, value: value, results: results);

  @override
  Stream<ResultsScreenState> mapEventToState(ResultsScreenEvent event) async* {}
}
