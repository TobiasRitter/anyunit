import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConverterState extends Equatable {
  ConverterState([List props = const []]) : super(props);
}

class InitialConverterState extends ConverterState {}
