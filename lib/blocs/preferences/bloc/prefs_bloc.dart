import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'prefs_event.dart';
part 'prefs_state.dart';

class PrefsBloc extends HydratedBloc<PrefsEvent, PrefsState> {
  @override
  PrefsState get initialState => super.initialState ?? PrefsState.initial();

  //var ab = PrefsState();
//use copywith to update specific values of the state
  @override
  Stream<PrefsState> mapEventToState(
    PrefsEvent event,
  ) async* {
    switch (event) {
      case PrefsEvent.ToggleShowBattery:
        yield state.copyWith(showBattery: !state.showBattery);
        break;
      case PrefsEvent.ToggleShowSearchBar:
        yield state.copyWith(showSearchBar: !state.showSearchBar);
        break;
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  PrefsState fromJson(Map<String, dynamic> json) {
    return PrefsState(
        showBattery: json['showBattery'],
        showCalls: json['showCalls'],
        showSearchBar: json['showSearchBar'] ?? true);
  }

  @override
  Map<String, dynamic> toJson(PrefsState state) {
    return {
      'showBattery': state.showBattery,
      'showCalls': state.showCalls,
      'showSearchBar': state.showSearchBar
    };
  }
}
