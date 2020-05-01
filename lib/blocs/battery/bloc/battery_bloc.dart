import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:battery/battery.dart' as B;

part 'battery_event.dart';
part 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  StreamSubscription batterySubscription;
  @override
  BatteryState get initialState => BatteryInitial();

  @override
  Stream<BatteryState> mapEventToState(
    BatteryEvent event,
  ) async* {
    if (event is LoadBattery) {
      batterySubscription = B.Battery().onBatteryStateChanged.listen((state) {
        add(BatteryUpdated(state));
      });
    }
    if (event is BatteryUpdated) {
      if (event.batteryState == B.BatteryState.charging) {
        yield Charging();
      } else if (event.batteryState == B.BatteryState.discharging) {
        yield Discharging();
      }
    }
  }

  @override
  Future<void> close() {
    batterySubscription.cancel();
    return super.close();
  }
}
