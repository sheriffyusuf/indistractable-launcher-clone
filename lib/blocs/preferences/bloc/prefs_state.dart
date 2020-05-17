part of 'prefs_bloc.dart';

class PrefsState extends Equatable {
  final bool showBattery;
  final bool showCalls;
  final bool showSearchBar;
  final bool is12hourTime;

  PrefsState(
      {this.showBattery,
      this.showCalls,
      this.showSearchBar,
      this.is12hourTime});

  factory PrefsState.initial() {
    return PrefsState(
        showBattery: true,
        showCalls: true,
        showSearchBar: true,
        is12hourTime: true);
  }

  PrefsState copyWith(
      {bool showBattery,
      bool showCalls,
      bool showSearchBar,
      bool is12hourTime}) {
    return PrefsState(
        showBattery: showBattery ?? this.showBattery,
        showCalls: showCalls ?? this.showCalls,
        showSearchBar: showSearchBar ?? this.showSearchBar,
        is12hourTime: is12hourTime ?? this.is12hourTime);
  }

  @override
  List<Object> get props =>
      [showBattery, showCalls, showSearchBar, is12hourTime];
}
