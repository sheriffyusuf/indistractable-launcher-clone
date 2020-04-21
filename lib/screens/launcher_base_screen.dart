import 'package:flutter/material.dart';
import 'package:indistractable_clone/screens/apps/apps_screen.dart';
import 'package:indistractable_clone/screens/home/home_screen.dart';

class LauncherBaseScreen extends StatefulWidget {
  @override
  _LauncherBaseScreenState createState() => _LauncherBaseScreenState();
}

class _LauncherBaseScreenState extends State<LauncherBaseScreen> {
  PageController _pageController;
  // bool _statusBarHidden = false;

  @override
  void initState() {
    super.initState();
    //   FlutterStatusbarManager.setHidden(_statusBarHidden);
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: <Widget>[HomeScreen(), AppsScreen()],
    ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
