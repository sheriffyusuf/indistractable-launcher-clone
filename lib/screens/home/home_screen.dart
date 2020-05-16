import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/battery/bloc/battery_bloc.dart';
import 'package:indistractable_clone/blocs/battery_level/bloc/battery_level_bloc.dart';
import 'package:indistractable_clone/blocs/preferences/bloc/prefs_bloc.dart';
import 'package:indistractable_clone/screens/home/widgets/date_and_time.dart';
import 'package:indistractable_clone/screens/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle normalTextStyle = TextStyle(fontSize: 26);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DateTimeWidget(),
                SizedBox(height: 12),
                BlocBuilder<PrefsBloc, PrefsState>(builder: (context, state) {
                  return state.showBattery
                      ? Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                BlocBuilder<BatteryBloc, BatteryState>(
                                    builder: (context, state) {
                                  if (state is Discharging) {
                                    return Container();
                                  } else if (state is Charging) {
                                    return Icon(Icons.add, size: 10);
                                  }
                                  if (state is BatteryInitial) {
                                    return Container();
                                  }
                                  return Container();
                                }),
                                SizedBox(
                                  width: 3,
                                ),
                                BlocBuilder<BatteryLevelBloc, int>(
                                    builder: (context, batteryLevel) {
                                  return Text('$batteryLevel%');
                                })
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        )
                      : Container();
                }),
                Text(
                  "Set as default launcher",
                  style: TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                )
              ],
            ),
            Spacer(),
            Text(
              "Calls",
              style: normalTextStyle,
              // use this when its time to configure dialer - com.android.dialer
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tasks",
              style: normalTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Feedback",
              style: normalTextStyle,
              // use this when its time to configure feedback - com.rlk.feedback
            ),
            Spacer(),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SettingsScreen.id);
                  },
                  child: Icon(
                    Icons.more_horiz,
                    size: 24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
