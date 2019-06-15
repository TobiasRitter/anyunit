import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConverterEvent extends Equatable {
  ConverterEvent([List props = const []]) : super(props);
}
