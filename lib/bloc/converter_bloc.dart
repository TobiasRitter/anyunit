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
    } else if (event is ConvertButtonPressedEvent) {
      yield LoadingState();
    } else if (event is CategoryChangedEvent) {
      yield (currentState as InputState).copyWith(category: event.category);
    }
  }
}
