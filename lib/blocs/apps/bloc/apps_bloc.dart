import 'dart:async';
import 'dart:convert';
import 'package:device_apps/device_apps.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:indistractable_clone/blocs/apps/bloc/apps.dart';
import 'package:indistractable_clone/models/App.dart';

class AppsBloc extends HydratedBloc<AppsEvent, AppsState> {
  @override
  AppsState get initialState => super.initialState ?? AppsLoadInProgress();

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
      final appsList = await DeviceApps.getInstalledApplications(
          onlyAppsWithLaunchIntent: true, includeSystemApps: true);
      final apps = appsList
          .map((app) => App(
              appName: app.appName,
              apkFilePath: app.apkFilePath,
              packageName: app.packageName,
              versionName: app.versionName,
              versionCode: app.versionCode,
              dataDir: app.dataDir,
              systemApp: app.systemApp,
              installTimeMilis: app.installTimeMilis,
              updateTimeMilis: app.updateTimeMilis))
          .toList();
      apps.sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
      yield AppsLoaded(
        apps: apps,
      );
    } catch (_) {
      yield AppsLoadFailure();
    }
  }

  @override
  AppsState fromJson(Map<String, dynamic> json) {
    // print(jsonDecode(json['apps']).toString());
    // List<App> apps = jsonDecode(json['apps']).map((app) {
    // print(app);
    // return App.fromMap(app);
    // }).toList();
    //print(apps.toString());
    // print(apps.last.toString());
    //  print(jsonDecode(json['apps']).toString());
    //List<App> apps = Apps.fromJson(json).apps;
    // print(apps.toString());
    List<App> apps =
        jsonDecode(json['apps']).map<App>((app) => App.fromJson(app)).toList();
    print(apps.last.appName.toString());
    //print(apps.last.toString());
    return AppsLoaded(apps: Apps.fromJson(json).apps);
  }

  @override
  Map<String, dynamic> toJson(AppsState state) {
    //jsonEncode(state.apps.map((e) => e.toJson()).toList())
    if (state is AppsLoaded)
      return {'apps': jsonEncode(state.apps)};
    else
      return null;
  }
}
