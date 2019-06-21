import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ResultsScreenEvent extends Equatable {
  ResultsScreenEvent([List props = const []]) : super(props);
}
