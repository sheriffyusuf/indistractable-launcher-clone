import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/battery/bloc/battery_bloc.dart';
import 'package:indistractable_clone/screens/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

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
                Text(
                  "7:10 AM",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 12),
                Text(
                  "Friday, 20th March",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 12),
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
                        return Icon(Icons.apps);
                      }
                      return Container();
                    }),

                    /* Icon(
                      Icons.add,
                      size: 10,
                    ), */
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "35%",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
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
