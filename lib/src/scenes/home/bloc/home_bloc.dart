import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:research/src/scenes/home/bloc/home_event.dart';
import 'package:research/src/scenes/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<FetchHealthData>(onFetchHealthData);
  }

  void onFetchHealthData(FetchHealthData event, Emitter<HomeState> emit) async {
    emit(state.copy(status: FetchHealthDataStatus.processing));
    List<HealthDataPoint> healthData = [];
    String? heartRate;
    String? bp;
    String? steps;
    String? activeEnergy;
    String? bloodPreSys;
    String? bloodPreDia;

    HealthFactory health = event.health;
    final types = [
      HealthDataType.HEART_RATE,
      HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
      HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    bool requested = await health.requestAuthorization(types);

    if (requested) {
      try {
        healthData = await health.getHealthDataFromTypes(yesterday, now, types);
        if (healthData.isNotEmpty) {
          for (HealthDataPoint h in healthData) {
            if (h.type == HealthDataType.HEART_RATE) {
              heartRate = "${h.value}";
            } else if (h.type == HealthDataType.BLOOD_PRESSURE_SYSTOLIC) {
              bloodPreSys = "${h.value}";
            } else if (h.type == HealthDataType.BLOOD_PRESSURE_DIASTOLIC) {
              bloodPreDia = "${h.value}";
            } else if (h.type == HealthDataType.STEPS) {
              steps = "${h.value}";
            } else if (h.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
              activeEnergy = "${h.value}";
            }
          }
          if (bloodPreSys != "null" && bloodPreDia != "null") {
            bp = "$bloodPreSys / $bloodPreDia mmHg";
          }
        }
      } catch (e) {
        debugPrint("Exception in getHealthDataFromTypes: $e");
      }
      healthData = HealthFactory.removeDuplicates(healthData);
      emit(state.copy(
        status: FetchHealthDataStatus.success,
        heartRate: heartRate,
        bp: bp,
        steps: steps,
        activeEnergy: activeEnergy,
      ));
    } else {
      debugPrint("Authorization not granted");
    }
  }
}
