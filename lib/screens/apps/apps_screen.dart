import 'package:android_intent/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/search/bloc/search.dart';
import 'package:indistractable_clone/screens/apps/widgets/dialog_text.dart';
import 'package:platform/platform.dart';
import 'package:android_intent/flag.dart';

class AppsScreen extends StatefulWidget {
  @override
  _AppsScreenState createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    //List names = List.generate(20, (index) => "sheriff $index");
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SearchLoaded) {
        final apps = state.sApps;
        return SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: _width,
                height: _height * 0.10,
                //    color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                      .add(SearchTextChanged(value)),
                  decoration: InputDecoration(
                    hintText: "Search Apps",
                    //   hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 8),
                    itemCount: apps.length,
                    itemBuilder: (context, position) {
                      final app = apps[position];
                      return ListTile(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      DialogText(
                                        title: "Add to favorites",
                                      ),
                                      SizedBox(height: 24),
                                      DialogText(
                                        title: "Hide app",
                                      ),
                                      SizedBox(height: 24),
                                      DialogText(
                                        title: "Rename App",
                                      ),
                                      SizedBox(height: 24),
                                      DialogText(
                                        title: "App Info",
                                        onPressed: () {
                                          print(app.packageName.toString());
                                          if (LocalPlatform().isAndroid) {
                                            Navigator.pop(context);
                                            final AndroidIntent intent =
                                                AndroidIntent(
                                              flags: <int>[
                                                Flag.FLAG_ACTIVITY_NEW_TASK
                                              ],
                                              action:
                                                  'action_application_details_settings',
                                              data:
                                                  'package:${app.packageName}', // replace com.example.app with your applicationId
                                            );
                                            intent.launch();
                                          }
                                        },
                                      ),
                                      SizedBox(height: 24),
                                      DialogText(
                                        title: "Uninstall",
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        onTap: () {
                          print(app.packageName.toString());
                          DeviceApps.openApp(app.packageName);
                        },
                        title: Text(
                          app.appName,
                          style: TextStyle(fontSize: 26),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
