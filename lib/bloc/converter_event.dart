import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// abstract class for a converter event
@immutable
abstract class ConverterEvent extends Equatable {
  ConverterEvent([List props = const []]) : super(props);
}

/// gets raised whenever the unit is changed
class UnitChangedEvent extends ConverterEvent {
  final int unit;

  UnitChangedEvent({
    @required this.unit,
  });
}

/// gets raised whenever the convert button is pressed
class ConvertButtonPressedEvent extends ConverterEvent {
  final double value;

  ConvertButtonPressedEvent({
    @required this.value,
  });
}

/// gets raised whenever the unit category is changed
class CategoryChangedEvent extends ConverterEvent {
  final int category;

  CategoryChangedEvent({
    @required this.category,
  });
}