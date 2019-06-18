import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// abstract class for a converter event
@immutable
abstract class ConverterEvent extends Equatable {
  ConverterEvent([List props = const []]) : super(props);
}

/// gets raised whenever the unit is changed
class UnitChangedEvent extends ConverterEvent {}

/// gets raised whenever the value is changed
class ValueChangedEvent extends ConverterEvent {}

/// gets raised whenever the convert button is pressed
class ConvertButtonPressedEvent extends ConverterEvent {}

/// gets raised whenever the unit category is changed
class CategoryChangedEvent extends ConverterEvent {}
