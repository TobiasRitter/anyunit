import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// abstract class for a converter event
@immutable
abstract class InputScreenEvent extends Equatable {
  InputScreenEvent([List props = const []]) : super(props);
}

/// gets raised whenever the unit is changed
class UnitChangedEvent extends InputScreenEvent {
  final String unit;

  UnitChangedEvent({
    @required this.unit,
  });
}

/// gets raised whenever the unit category is changed
class CategoryChangedEvent extends InputScreenEvent {
  final int categoryIndex;

  CategoryChangedEvent({
    @required this.categoryIndex,
  });
}

/// gets raised whenever the value is changed
class ValueChangedEvent extends InputScreenEvent {
  final String value;

  ValueChangedEvent({
    @required this.value,
  });
}
