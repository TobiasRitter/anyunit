import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  @override
  ConverterState get initialState => InitialConverterState();

  @override
  Stream<ConverterState> mapEventToState(
    ConverterEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
