// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research/src/scenes/root/bloc/root_bloc.dart';
import 'package:research/src/scenes/root/bloc/root_state.dart';
import 'package:research/src/scenes/root/page/root_body.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootBloc>(
        create: (context) => RootBloc(),
        child: BlocListener<RootBloc, RootState>(
          listener: ((context, state) {}),
          child: RootBody(),
        ));
  }
}
