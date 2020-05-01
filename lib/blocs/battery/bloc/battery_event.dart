part of 'battery_bloc.dart';

abstract class BatteryEvent extends Equatable {
  const BatteryEvent();

  @override
  List<Object> get props => [];
}

class LoadBattery extends BatteryEvent {}

class BatteryUpdated extends BatteryEvent {
  final B.BatteryState batteryState;
  const BatteryUpdated(this.batteryState);

  @override
  List<Object> get props => [batteryState];
}
