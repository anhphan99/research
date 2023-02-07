// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research/src/scenes/root/bloc/root_event.dart';
import 'package:research/src/scenes/root/bloc/root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(RootState.home()) {
    on<HomeSelected>(onHomeSelected);
    on<HelpSelected>(onHelpSelected);
  }
}

void onHomeSelected(HomeSelected event, Emitter<RootState> emit) async {
  emit(RootState.home());
}

void onHelpSelected(HelpSelected event, Emitter<RootState> emit) async {
  emit(RootState.help());
}
