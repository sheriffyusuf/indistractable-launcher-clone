import 'package:equatable/equatable.dart';
import 'package:indistractable_clone/models/App.dart';

abstract class AppsState extends Equatable {
  const AppsState();
  @override
  List<Object> get props => [];
}

class AppsLoadInProgress extends AppsState {}

class AppsLoaded extends AppsState {
  final List<App> apps;

  const AppsLoaded({this.apps = const []});

  @override
  List<Object> get props => [apps];
}

class AppsLoadFailure extends AppsState {}
