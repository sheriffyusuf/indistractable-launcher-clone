part of 'battery_level_bloc.dart';

abstract class BatteryLevelEvent extends Equatable {
  const BatteryLevelEvent();

  @override
  List<Object> get props => [];
}

class LoadBatteryLevel extends BatteryLevelEvent {}

class UpdateBatteryLevel extends BatteryLevelEvent {
  final int batteryLevel;

  const UpdateBatteryLevel(this.batteryLevel);

  @override
  List<Object> get props => [batteryLevel];
}
