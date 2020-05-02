import 'package:flutter/material.dart';
import 'package:indistractable_clone/screens/settings/widgets/theme_text_button.dart';
import 'package:theme_provider/theme_provider.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(0.0),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color),
                    onPressed: () => Navigator.pop(context)),
                title: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: _normalTextStyle,
                ),
                trailing: SizedBox(width: 30),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  ListTile(
                      title: Text(
                    "Launcher Preferences",
                    style: _normalTextStyle,
                  )),
                  ExpansionTile(
                    trailing: SizedBox.shrink(),
                    title: Text(
                      "Change Theme",
                      style: _normalTextStyle,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ThemeTextButton(
                              title: 'Black',
                              themeId: 'black_theme',
                            ),
                            ThemeTextButton(
                              title: 'White',
                              themeId: 'white_theme',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  ListTile(
                      title: Text(
                    "Device Settings",
                    // use this when its time to configure settings - com.android.settings
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
      ),
    );
  }
}
