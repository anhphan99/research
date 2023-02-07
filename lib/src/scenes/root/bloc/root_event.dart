import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  @override
  List<dynamic> get props => [];
}

class HomeSelected extends RootEvent {}

class HelpSelected extends RootEvent {}
