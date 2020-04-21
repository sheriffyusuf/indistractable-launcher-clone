import 'package:flutter/material.dart';
import 'package:indistractable_clone/screens/settings/settings_screen.dart';
import 'package:theme_provider/theme_provider.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  SettingsScreen.id: (context) => ThemeConsumer(child: SettingsScreen()),
  //EventDetail.id: (context) =>
  //     EventDetail(event: ModalRoute.of(context).settings.arguments),
  //AddEventScreen.id: (context) => AddEventScreen()
};
