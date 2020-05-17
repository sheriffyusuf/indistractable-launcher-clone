import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/preferences/bloc/prefs_bloc.dart';
import 'package:indistractable_clone/screens/settings/widgets/prefs_text_button.dart';
import 'package:indistractable_clone/screens/settings/widgets/theme_text_button.dart';

class SettingsScreen extends StatefulWidget {
  static final String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle _normalTextStyle = TextStyle(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final prefsBloc = BlocProvider.of<PrefsBloc>(context);

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
              Container(
                height: height * 0.58,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BlocBuilder<PrefsBloc, PrefsState>(
                        builder: (context, state) => ExpansionTile(
                          trailing: SizedBox.shrink(),
                          title: Text(
                            "Launcher Preferences",
                            style: _normalTextStyle,
                          ),
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    PrefsTextButton(
                                      title: 'Manage Hidden Apps',
                                    ),
                                    PrefsTextButton(
                                      title: 'Manage Favourites',
                                    ),
                                    PrefsTextButton(
                                      title: 'Show App Icons',
                                    ),
                                    PrefsTextButton(
                                      title: 'Show Status Bar',
                                    ),
                                    PrefsTextButton(
                                      title: state.showSearchBar
                                          ? 'Hide Search Bar'
                                          : 'Show Search Bar',
                                      onTap: () {
                                        prefsBloc.add(
                                            PrefsEvent.ToggleShowSearchBar);
                                        print("done changing battery level");
                                      },
                                    ),
                                    PrefsTextButton(
                                      title: 'Hide Character Scroll',
                                    ),
                                    PrefsTextButton(
                                      title: state.showBattery
                                          ? 'Hide Battery Level'
                                          : 'Show Battery Level',
                                      onTap: () {
                                        prefsBloc
                                            .add(PrefsEvent.ToggleShowBattery);
                                      },
                                    ),
                                    PrefsTextButton(
                                      title: state.is12hourTime
                                          ? 'Change to 24H Time Format'
                                          : 'Change to 12H Time Format',
                                      onTap: () {
                                        prefsBloc
                                            .add(PrefsEvent.ToggleTimeFormat);
                                      },
                                    ),
                                    PrefsTextButton(
                                      title: 'Hide default Tasks',
                                    ),
                                    PrefsTextButton(
                                      title: 'Hide default Calls',
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
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
                ),
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

  @override
  void dispose() {
    super.dispose();
  }
}
