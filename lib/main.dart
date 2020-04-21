import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indistractable_clone/routes.dart';
import 'package:indistractable_clone/screens/launcher_base_screen.dart';
import 'package:indistractable_clone/theme/style.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:theme_provider/theme_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var installedApps;
  var wallpaper;
  bool accessStorage;

  @override
  void initState() {
    accessStorage = false;
    super.initState();
    LauncherAssist.getAllApps().then((apps) {
      setState(() {
        installedApps = apps;
        print(installedApps[0].toString());
      });
    });
    handleStoragePermission().then((permissionGranted) {
      if (permissionGranted) {
        LauncherAssist.getWallpaper().then((imageData) {
          setState(() {
            wallpaper = imageData;
            accessStorage = !accessStorage;
          });
        });
      } else {
        print("inside of the else part");
      }
    });
  }

  Future<bool> handleStoragePermission() async {
    PermissionStatus storagePermissionStatus = await _getPermissionStatus();
    if (storagePermissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      _handleInvalidPermission(storagePermissionStatus);
      return false;
    }
  }

  void _handleInvalidPermission(PermissionStatus storagePermissionStatus) {
    if (storagePermissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION DENIED",
          message: "Access to location data denied",
          details: null);
    } else if (storagePermissionStatus == PermissionStatus.restricted) {
      throw new PlatformException(
          code: "PERMISSION DISABLED",
          message: "Location data is not availble on device",
          details: null);
    }
  }

  Future<PermissionStatus> _getPermissionStatus() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.restricted) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      return permissionStatus[PermissionGroup.storage] != null
          ? permissionStatus[PermissionGroup.storage]
          : PermissionStatus.unknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (accessStorage) {
      setState(() {});
    }

    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: <AppTheme>[
        blackAppTheme(),
        AppTheme.dark(),
        AppTheme.light(),

        //   customAppTheme(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Indistractable",
        color: Colors.white,
        home: ThemeConsumer(
          child: LauncherBaseScreen(),
        ),
        routes: routes,
      ),
    );
  }

  /*  return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LauncherBaseScreen()
        /*  Scaffold(
            body: WillPopScope(
          onWillPop: () => Future(() => false),
          child: Stack(
            children: <Widget>[
              WallpaperContainer(wallpaper: wallpaper),
              installedApps != null
                  ? ForegroundWidget(installedApps: installedApps)
                  : Container(),
              accessStorage
                  ? Container()
                  : Positioned(
                      top: 0,
                      left: 20,
                      child: SafeArea(
                          child: Tooltip(
                              message: "Click this to allow storage permission",
                              child: GestureDetector(
                                  onTap: () {
                                    handleStoragePermission()
                                        .then((permissionGranted) {
                                      if (permissionGranted) {
                                        LauncherAssist.getWallpaper()
                                            .then((imageData) {
                                          setState(() {
                                            wallpaper = imageData;
                                            accessStorage = !accessStorage;
                                          });
                                        });
                                      } else {
                                        print("inside of the else part");
                                      }
                                    });
                                  },
                                  child:
                                      Icon(Icons.storage, color: Colors.red)))))
            ],
          ),
        ))*/
         */ //MyHomePage(title: 'Flutter Demo Home Page'),
  //       );
  // }
}

class ForegroundWidget extends StatefulWidget {
  const ForegroundWidget({Key key, @required this.installedApps})
      : super(key: key);
  final installedApps;

  @override
  _ForegroundWidgetState createState() => _ForegroundWidgetState();
}

class _ForegroundWidgetState extends State<ForegroundWidget>
    with SingleTickerProviderStateMixin {
  AnimationController opacityController;
  Animation<double> _opacity;
  @override
  void initState() {
    super.initState();
    opacityController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _opacity = Tween(begin: 0.0, end: 1.0).animate(opacityController);
  }

  @override
  Widget build(BuildContext context) {
    opacityController.forward();
    return FadeTransition(
        opacity: _opacity,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: gridViewContainer(widget.installedApps),
        ));
  }

  gridViewContainer(installedApps) {
    return GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 40,
        physics: BouncingScrollPhysics(),
        children: List.generate(
            installedApps != null ? installedApps.length : 0, (index) {
          return GestureDetector(
              onTap: () =>
                  LauncherAssist.launchApp(installedApps[index]["package"]),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    iconContainer(index),
                    SizedBox(height: 10),
                    Text(
                      installedApps[index]["label"],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ));
        }));
  }

  iconContainer(index) {
    try {
      return Image.memory(
        widget.installedApps[index]["icon"] != null
            ? widget.installedApps[index]["icon"]
            : Uint8List(0),
        height: 40,
        width: 40,
      );
    } catch (e) {}
  }
}

class WallpaperContainer extends StatelessWidget {
  const WallpaperContainer({Key key, @required this.wallpaper})
      : super(key: key);

  final wallpaper;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.memory(wallpaper != null ? wallpaper : Uint8List(0),
            fit: BoxFit.cover));
  }
}
