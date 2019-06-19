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
      yield (currentState as InputState).copyWith(unitIndex: event.unitIndex);
    } else if (event is StartConversionEvent) {
      yield LoadingState(
        value: event.value,
        unit: null,
      );
      yield ResultState(
        value: event.value,
        unit: null,
        results: null,
      );
    } else if (event is CategoryChangedEvent) {
      yield (currentState as InputState)
          .copyWith(categoryIndex: event.categoryIndex);
    } else if (event is BackToInputEvent) {
      yield InputState.initial(
        categories: <String>{
          "Weight",
          "Temperature",
        },
        units: <String>{
          "kg",
        },
      );
    }
  }
}
