part of 'prefs_bloc.dart';

class PrefsState extends Equatable {
  final bool showBattery;
  final bool showCalls;
  final bool showSearchBar;
  final bool is12hourTime;
  final bool showStatusBar;

  PrefsState(
      {this.showBattery,
      this.showCalls,
      this.showSearchBar,
      this.is12hourTime,
      this.showStatusBar});

  factory PrefsState.initial() {
    return PrefsState(
        showBattery: true,
        showCalls: true,
        showSearchBar: true,
        is12hourTime: true,
        showStatusBar: true);
  }

  PrefsState copyWith(
      {bool showBattery,
      bool showCalls,
      bool showSearchBar,
      bool is12hourTime,
      bool showStatusBar}) {
    return PrefsState(
        showBattery: showBattery ?? this.showBattery,
        showCalls: showCalls ?? this.showCalls,
        showSearchBar: showSearchBar ?? this.showSearchBar,
        is12hourTime: is12hourTime ?? this.is12hourTime,
        showStatusBar: showStatusBar ?? this.showStatusBar);
  }

  @override
  List<Object> get props =>
      [showBattery, showCalls, showSearchBar, is12hourTime, showStatusBar];
}
