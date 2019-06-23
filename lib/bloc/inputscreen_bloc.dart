import 'dart:async';
import 'package:cleverconvert/bloc/inputscreen_event.dart';
import 'package:cleverconvert/bloc/inputscreen_state.dart';
import 'package:cleverconvert/model/converter.dart';
import 'package:bloc/bloc.dart';

/// bloc for the input page
class InputScreenBloc extends Bloc<InputScreenEvent, InputScreenState> {
  @override
  InputScreenState get initialState => InputScreenState.initial(
        categories: Converter.categories
            .map<String>((category) => category.name)
            .toSet(),
        units:
            Converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );

  @override
  Stream<InputScreenState> mapEventToState(
    InputScreenEvent event,
  ) async* {
    if (event is UnitChangedEvent) {
      Converter.selectedUnit = Converter.selectedCategory.units
          .firstWhere((unit) => unit.name == event.unit);
      yield currentState.copyWith(
        unit: event.unit,
      );
    } else if (event is CategoryChangedEvent) {
      Converter.selectedCategory =
          Converter.categories.elementAt(event.categoryIndex);
      yield currentState.copyWith(
        categoryIndex: event.categoryIndex,
        unit: Converter.selectedUnit.name,
        units:
            Converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );
    } else if (event is ValueChangedEvent) {
      Converter.value = event.value;
      yield currentState.copyWith(
        value: event.value.toString(),
      );
    }
  }

  /// gets called whenever the unit in the view changes
  void onUnitChanged(String unit) => dispatch(UnitChangedEvent(unit: unit));

  /// gets called whenever the category in the view changes
  void onCategoryChanged(int categoryIndex) =>
      dispatch(CategoryChangedEvent(categoryIndex: categoryIndex));

  /// gets called whenever the value in the view changes
  void onValueChanged(String value) =>
      dispatch(ValueChangedEvent(value: double.parse(value)));
}
