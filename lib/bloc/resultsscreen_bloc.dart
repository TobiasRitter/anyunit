import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

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
