part of 'prefs_bloc.dart';

class PrefsState extends Equatable {
  final bool showBattery;
  final bool showCalls;
  final bool showSearchBar;

  PrefsState({this.showBattery, this.showCalls, this.showSearchBar});

  factory PrefsState.initial() {
    return PrefsState(showBattery: true, showCalls: true, showSearchBar: true);
  }

  PrefsState copyWith({bool showBattery, bool showCalls, bool showSearchBar}) {
    return PrefsState(
        showBattery: showBattery ?? this.showBattery,
        showCalls: showCalls ?? this.showCalls,
        showSearchBar: showSearchBar ?? this.showSearchBar);
  }

  @override
  List<Object> get props => [showBattery, showCalls, showSearchBar];
}
