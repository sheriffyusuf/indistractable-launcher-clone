import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/preferences/bloc/prefs_bloc.dart';
import 'package:indistractable_clone/screens/apps/apps_screen.dart';
import 'package:indistractable_clone/screens/home/home_screen.dart';
import 'package:simple_status_bar/simple_status_bar.dart';

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
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrefsBloc, PrefsState>(builder: (context, state) {
      bool showStatusBar = state.showStatusBar;
      SimpleStatusBar.toggle(show: showStatusBar);
      return Scaffold(
          body: PageView(
        controller: _pageController,
        children: <Widget>[HomeScreen(), AppsScreen()],
      ));
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
