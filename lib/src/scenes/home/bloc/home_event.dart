import 'package:equatable/equatable.dart';
import 'package:health/health.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchHealthData extends HomeEvent {
  HealthFactory health = HealthFactory();

  FetchHealthData();

  @override
  List<Object?> get props => [health];
}
