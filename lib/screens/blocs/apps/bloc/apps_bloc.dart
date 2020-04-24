import 'dart:async';
import 'package:device_apps/device_apps.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/screens/blocs/apps/bloc/apps.dart';

class AppsBloc extends Bloc<AppsEvent, AppsState> {
  @override
  AppsState get initialState => AppsLoadInProgress();

  @override
  Stream<AppsState> mapEventToState(
    AppsEvent event,
  ) async* {
    if (event is AppsLoadSuccess) {
      yield* _mapAppsLoadedToState();
    }
  }

  Stream<AppsState> _mapAppsLoadedToState() async* {
    try {
      final apps = await DeviceApps.getInstalledApplications(
          onlyAppsWithLaunchIntent: true, includeSystemApps: true);
      apps.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      yield AppsLoaded(
        apps: apps,
      );
    } catch (_) {
      yield AppsLoadFailure();
    }
  }
}
