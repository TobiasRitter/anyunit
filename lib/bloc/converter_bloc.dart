import 'dart:async';
import 'package:anyunit/model/category.dart';
import 'package:anyunit/model/converter.dart';
import 'package:anyunit/model/unit.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
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
  ConverterState get initialState => InputState.initial(
        categories: converter.categories
            .map<String>((category) => category.name)
            .toSet(),
        units:
            converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );

  @override
  Stream<ConverterState> mapEventToState(
    ConverterEvent event,
  ) async* {
    if (event is UnitChangedEvent) {
      converter.selectedUnit = converter.selectedCategory.units
          .firstWhere((unit) => unit.name == event.unit);
      yield (currentState as InputState).copyWith(
        unit: event.unit,
      );
    } else if (event is StartConversionEvent) {
      yield ResultState(
        value: event.value,
        unit: converter.selectedUnit.name,
        results: converter.convert(originalValue: event.value),
      );
    } else if (event is CategoryChangedEvent) {
      converter.selectedCategory =
          converter.categories.elementAt(event.categoryIndex);
      converter.selectedUnit = converter.selectedCategory.units.elementAt(0);
      yield (currentState as InputState).copyWith(
        categoryIndex: event.categoryIndex,
        unit: converter.selectedUnit.name,
        units:
            converter.selectedCategory.units.map((unit) => unit.name).toSet(),
      );
    } else if (event is BackToInputEvent) {
      yield initialState;
    }
  }
}
