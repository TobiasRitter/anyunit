import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// abstract class for a converter event
@immutable
abstract class ConverterEvent extends Equatable {
  ConverterEvent([List props = const []]) : super(props);
}

/// gets raised whenever the unit is changed
class UnitChangedEvent extends ConverterEvent {
  final int unitIndex;

  UnitChangedEvent({
    @required this.unitIndex,
  });
}

/// gets raised whenever the convert button is pressed
class StartConversionEvent extends ConverterEvent {
  final String value;

  StartConversionEvent({
    @required this.value,
  });
}

/// gets raised whenever the unit category is changed
class CategoryChangedEvent extends ConverterEvent {
  final int categoryIndex;

  CategoryChangedEvent({
    @required this.categoryIndex,
  });
}

/// gets raised whenever the back button is pressed
class BackToInputEvent extends ConverterEvent {}
