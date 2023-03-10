import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research/src/scenes/home/bloc/home_bloc.dart';
import 'package:research/src/scenes/home/bloc/home_event.dart';
import 'package:research/src/scenes/home/page/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(FetchHealthData()),
      child: HomeBody(),
    );
  }
}
