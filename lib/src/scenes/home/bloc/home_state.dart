// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:health/health.dart';

enum FetchHealthDataStatus { init, processing, success, failure }

class HomeState extends Equatable {
  final FetchHealthDataStatus status;
  final String? heartRate;
  final String? bp;

  HomeState({required this.status, this.heartRate, this.bp});

  static HomeState initial() => HomeState(status: FetchHealthDataStatus.init);

  @override
  List<Object?> get props => [status, heartRate, bp];

  HomeState copy({
    FetchHealthDataStatus? status,
    String? heartRate,
    String? bp,
  }) {
    return HomeState(
      status: status ?? this.status,
      heartRate: heartRate ?? this.heartRate,
      bp: bp ?? this.bp,
    );
  }
}
