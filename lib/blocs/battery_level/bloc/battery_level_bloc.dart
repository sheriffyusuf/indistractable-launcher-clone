import 'dart:async';

import 'package:battery/battery.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'battery_level_event.dart';

class BatteryLevelBloc extends Bloc<BatteryLevelEvent, int> {
  StreamSubscription batteryLevelSub;

  BatteryLevelBloc() {
    batteryLevelSub = getCurrentBattery().listen((batteryLevel) {
      add(UpdateBatteryLevel(batteryLevel));
    });
  }

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    BatteryLevelEvent event,
  ) async* {
    if (event is UpdateBatteryLevel) {
      yield event.batteryLevel;
    }
  }

  Stream<int> getCurrentBattery() async* {
    // _broadcastBattery = true;
    while (true) {
      int batteryLevel = await Battery().batteryLevel;
      await Future.delayed(Duration(seconds: 5));
      yield batteryLevel;
    }
  }

  @override
  Future<void> close() {
    batteryLevelSub.cancel();
    return super.close();
  }
}
