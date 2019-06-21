import 'dart:async';
import 'package:anyunit/bloc/inputscreen_event.dart';
import 'package:anyunit/bloc/inputscreen_state.dart';
import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/converter.dart';
import 'package:anyunit/model/unit.dart';
import 'package:bloc/bloc.dart';

class InputScreenBloc extends Bloc<InputScreenEvent, InputScreenState> {
  Converter converter = Converter(
    categories: <Category>{
      Category(
        name: "Weight",
        units: <Unit>{
          Unit(
            name: "g",
            getConvertedValue: (val) => val,
            getStandardizedValue: (val) => val,
          ),
          Unit(
            name: "kg",
            getConvertedValue: (val) => val / 1000,
            getStandardizedValue: (val) => val * 1000,
          ),
        },
      ),
      Category(
        name: "Temperature",
        units: <Unit>{
          Unit(
            name: "celcius",
            getConvertedValue: (val) => val - 273.15,
            getStandardizedValue: (val) => val + 273.15,
          ),
          Unit(
            name: "fahrenheit",
            getConvertedValue: (val) => (val - 273.15) * 9 / 5 + 32,
            getStandardizedValue: (val) => (val - 32) * 5 / 9 + 273.15,
          ),
        },
      ),
    },
  );

  @override
  InputScreenState get initialState => InputScreenState.initial(
        categories: converter.categories
            .map<String>((category) => category.name)
            .toSet(),
        units:
            converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );

  @override
  Stream<InputScreenState> mapEventToState(
    InputScreenEvent event,
  ) async* {
    if (event is UnitChangedEvent) {
      converter.selectedUnit = converter.selectedCategory.units
          .firstWhere((unit) => unit.name == event.unit);
      yield currentState.copyWith(
        unit: event.unit,
      );
    } else if (event is CategoryChangedEvent) {
      converter.selectedCategory =
          converter.categories.elementAt(event.categoryIndex);
      yield currentState.copyWith(
        categoryIndex: event.categoryIndex,
        unit: converter.selectedUnit.name,
        units:
            converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );
    } else if (event is ValueChangedEvent) {
      converter.value = double.parse(event.value);
      yield currentState.copyWith(
        value: converter.value.toString(),
      );
    }
  }

  void onUnitChanged(String unit) => dispatch(UnitChangedEvent(unit: unit));

  void onCategoryChanged(int categoryIndex) =>
      dispatch(CategoryChangedEvent(categoryIndex: categoryIndex));

  void onValueChanged(String value) =>
      dispatch(ValueChangedEvent(value: value));
}
