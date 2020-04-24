import 'package:equatable/equatable.dart';

abstract class AppsEvent extends Equatable {
  const AppsEvent();

  @override
  List<Object> get props => [];
}

class AppsLoadSuccess extends AppsEvent {}
