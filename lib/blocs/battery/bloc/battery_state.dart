part of 'battery_bloc.dart';

abstract class BatteryState extends Equatable {
  const BatteryState();

  @override
  List<Object> get props => [];
}

class BatteryInitial extends BatteryState {}

class Charging extends BatteryState {}

class Discharging extends BatteryState {}
