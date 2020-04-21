import 'package:equatable/equatable.dart';

abstract class AppsState extends Equatable {
  const AppsState();
}

class AppsInitial extends AppsState {
  @override
  List<Object> get props => [];
}
