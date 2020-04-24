import 'package:device_apps/device_apps.dart';
import 'package:equatable/equatable.dart';

abstract class AppsState extends Equatable {
  const AppsState();
  @override
  List<Object> get props => [];
}

class AppsLoadInProgress extends AppsState {}

class AppsLoaded extends AppsState {
  final List<Application> apps;

  const AppsLoaded({this.apps = const []});

  @override
  List<Object> get props => [apps];
}

class AppsLoadFailure extends AppsState {}
