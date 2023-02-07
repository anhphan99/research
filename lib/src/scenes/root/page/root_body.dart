import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research/src/scenes/home/page/home_page.dart';
import 'package:research/src/scenes/root/bloc/root_bloc.dart';
import 'package:research/src/scenes/root/bloc/root_event.dart';
import 'package:research/src/scenes/root/bloc/root_state.dart';
import 'package:research/src/scenes/root/widget/main_app_bar.dart';

class RootBody extends StatefulWidget {
  const RootBody({super.key});

  @override
  State<RootBody> createState() => _RootBodyState();
}

class _RootBodyState extends State<RootBody> {
  final components = TabBarCompoments();

  int selectedIndex(TabBarSection section) {
    switch (section) {
      case TabBarSection.home:
        return 0;
      case TabBarSection.help:
        return 1;
      default:
        return 0;
    }
  }

  void onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        BlocProvider.of<RootBloc>(context).add(HomeSelected());
        break;
      case 1:
        BlocProvider.of<RootBloc>(context).add(HelpSelected());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar.main(context, 'ANH PHAN'),
      body: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          return IndexedStack(
            index: selectedIndex(state.section),
            children: components.children,
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<RootBloc, RootState>(builder: ((context, state) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: components.item,
          currentIndex: selectedIndex(state.section),
          onTap: (index) => onItemTapped(index, context),
        );
      })),
    );
  }
}

class TabBarCompoments {
  final item = [
    BottomNavigationBarItem(
        activeIcon: Image.asset('assets/images/ic_home_active.png', height: 24),
        icon: Image.asset('assets/images/ic_home.png', height: 24),
        label: 'Home'),
    BottomNavigationBarItem(
        activeIcon:
            Image.asset('assets/images/ic_heartbeat_active.png', height: 24),
        icon: Image.asset('assets/images/ic_heartbeat.png', height: 24),
        label: 'Help'),
  ];

  // ignore: prefer_const_constructors
  final children = [HomePage(), Center(child: Text("home"))];
}
