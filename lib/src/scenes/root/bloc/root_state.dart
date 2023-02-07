import 'package:equatable/equatable.dart';

enum TabBarSection { home, help }

class RootState extends Equatable {
  final TabBarSection section;

  const RootState._({this.section = TabBarSection.home});

  const RootState.home() : this._(section: TabBarSection.home);

  const RootState.help() : this._(section: TabBarSection.help);

  @override
  List<dynamic> get props => [section];
}
