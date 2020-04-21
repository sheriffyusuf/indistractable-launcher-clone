import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static final String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle _normalTextStyle = TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Settings",
          style: _normalTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            Spacer(),
            Column(
              children: <Widget>[
                ListTile(
                    title: Text(
                  "Launcher Preferences",
                  style: _normalTextStyle,
                )),
                ListTile(
                    title: Text(
                  "Change Theme",
                  style: _normalTextStyle,
                )),
                ListTile(
                    title: Text(
                  "Device Settings",
                  style: _normalTextStyle,
                )),
                ListTile(
                    title: Text(
                  "Change Default Launcher",
                  style: _normalTextStyle,
                )),
              ],
            ),
            Spacer(),
            ListTile(
                title: Text(
              "Feedback",
              style: _normalTextStyle,
            ))
          ],
        ),
      ),
    );
  }
}
