import 'dart:async';
import 'package:cleverconvert/bloc/inputscreen_event.dart';
import 'package:cleverconvert/bloc/inputscreen_state.dart';
import 'package:cleverconvert/model/category.dart';
import 'package:cleverconvert/model/converter.dart';
import 'package:cleverconvert/model/unit.dart';
import 'package:bloc/bloc.dart';

/// bloc for the input page
class InputScreenBloc extends Bloc<InputScreenEvent, InputScreenState> {
  static Set<Category> categorySet = <Category>{
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
        Unit(
          name: "lbs",
          getConvertedValue: (val) => val / 2205,
          getStandardizedValue: (val) => val * 2205,
        ),
      },
    ),
    Category(
      name: "Temperature",
      units: <Unit>{
        Unit(
          name: "kelvin",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
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
    Category(
      name: "Distance",
      units: <Unit>{
        Unit(
          name: "m",
          getConvertedValue: (val) => val,
          getStandardizedValue: (val) => val,
        ),
        Unit(
          name: "cm",
          getConvertedValue: (val) => val * 100,
          getStandardizedValue: (val) => val / 100,
        ),
        Unit(
          name: "km",
          getConvertedValue: (val) => val / 1000,
          getStandardizedValue: (val) => val * 1000,
        ),
      },
    )
  };

  Converter converter = Converter(
    categories: categorySet,
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
    }
  }

  /// gets called whenever the unit in the view changes
  void onUnitChanged(String unit) => dispatch(UnitChangedEvent(unit: unit));

  /// gets called whenever the category in the view changes
  void onCategoryChanged(int categoryIndex) =>
      dispatch(CategoryChangedEvent(categoryIndex: categoryIndex));
}
