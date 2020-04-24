import 'package:flutter/material.dart';
import 'package:indistractable_clone/screens/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    Icon(
                      Icons.add,
                      size: 10,
                    ),
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
