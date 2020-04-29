/* import 'dart:convert';

class App {
  final String appName;
  final String apkFilePath;
  final String packageName;
  final String versionName;
  final int versionCode;
  final String dataDir;
  final bool systemApp;
  final int installTimeMilis;
  final int updateTimeMilis;

  App({
    this.appName,
    this.apkFilePath,
    this.packageName,
    this.versionName,
    this.versionCode,
    this.dataDir,
    this.systemApp,
    this.installTimeMilis,
    this.updateTimeMilis,
  });

  App copyWith({
    String appName,
    String apkFilePath,
    String packageName,
    String versionName,
    int versionCode,
    String dataDir,
    bool systemApp,
    int installTimeMilis,
    int updateTimeMilis,
  }) {
    return App(
      appName: appName ?? this.appName,
      apkFilePath: apkFilePath ?? this.apkFilePath,
      packageName: packageName ?? this.packageName,
      versionName: versionName ?? this.versionName,
      versionCode: versionCode ?? this.versionCode,
      dataDir: dataDir ?? this.dataDir,
      systemApp: systemApp ?? this.systemApp,
      installTimeMilis: installTimeMilis ?? this.installTimeMilis,
      updateTimeMilis: updateTimeMilis ?? this.updateTimeMilis,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'apkFilePath': apkFilePath,
      'packageName': packageName,
      'versionName': versionName,
      'versionCode': versionCode,
      'dataDir': dataDir,
      'systemApp': systemApp,
      'installTimeMilis': installTimeMilis,
      'updateTimeMilis': updateTimeMilis,
    };
  }

  static App fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return App(
      appName: map['appName'],
      apkFilePath: map['apkFilePath'],
      packageName: map['packageName'],
      versionName: map['versionName'],
      versionCode: map['versionCode'],
      dataDir: map['dataDir'],
      systemApp: map['systemApp'],
      installTimeMilis: map['installTimeMilis'],
      updateTimeMilis: map['updateTimeMilis'],
    );
  }

  String toJson() => json.encode(toMap());

  static App fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'App(appName: $appName, apkFilePath: $apkFilePath, packageName: $packageName, versionName: $versionName, versionCode: $versionCode, dataDir: $dataDir, systemApp: $systemApp, installTimeMilis: $installTimeMilis, updateTimeMilis: $updateTimeMilis)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is App &&
        o.appName == appName &&
        o.apkFilePath == apkFilePath &&
        o.packageName == packageName &&
        o.versionName == versionName &&
        o.versionCode == versionCode &&
        o.dataDir == dataDir &&
        o.systemApp == systemApp &&
        o.installTimeMilis == installTimeMilis &&
        o.updateTimeMilis == updateTimeMilis;
  }

  @override
  int get hashCode {
    return appName.hashCode ^
        apkFilePath.hashCode ^
        packageName.hashCode ^
        versionName.hashCode ^
        versionCode.hashCode ^
        dataDir.hashCode ^
        systemApp.hashCode ^
        installTimeMilis.hashCode ^
        updateTimeMilis.hashCode;
  }
}


 */

import 'dart:convert';

class App {
  String appName;
  String apkFilePath;
  String packageName;
  String versionName;
  int versionCode;
  String dataDir;
  bool systemApp;
  int installTimeMilis;
  int updateTimeMilis;

  App(
      {this.appName,
      this.apkFilePath,
      this.packageName,
      this.versionName,
      this.versionCode,
      this.dataDir,
      this.systemApp,
      this.installTimeMilis,
      this.updateTimeMilis});

  App.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    apkFilePath = json['apkFilePath'];
    packageName = json['packageName'];
    versionName = json['versionName'];
    versionCode = json['versionCode'];
    dataDir = json['dataDir'];
    systemApp = json['systemApp'];
    installTimeMilis = json['installTimeMilis'];
    updateTimeMilis = json['updateTimeMilis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appName'] = this.appName;
    data['apkFilePath'] = this.apkFilePath;
    data['packageName'] = this.packageName;
    data['versionName'] = this.versionName;
    data['versionCode'] = this.versionCode;
    data['dataDir'] = this.dataDir;
    data['systemApp'] = this.systemApp;
    data['installTimeMilis'] = this.installTimeMilis;
    data['updateTimeMilis'] = this.updateTimeMilis;
    return data;
  }
}

class Apps {
  List<App> apps;

  Apps({this.apps});

  Apps.fromJson(Map<String, dynamic> json) {
    if (json['apps'] != null) {
      apps = jsonDecode(json['apps'])
          .map<App>((app) => App.fromJson(app))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.apps != null) {
      data['apps'] = this.apps.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
