import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  @override
  ConverterState get initialState => InputState.initial();

  @override
  Stream<ConverterState> mapEventToState(
    ConverterEvent event,
  ) async* {
    if (event is UnitChangedEvent) {
      yield (currentState as InputState).copyWith(unit: event.unit);
    } else if (event is StartConversionEvent) {
      yield LoadingState(
        value: event.value,
        category: 0,
        unit: 0,
      );
      yield ResultState(
        value: event.value,
        category: 0,
        unit: 0,
        results: null,
      );
    } else if (event is CategoryChangedEvent) {
      yield (currentState as InputState).copyWith(category: event.category);
    } else if (event is BackToInputEvent) {
      yield InputState.initial();
    }
  }
}
