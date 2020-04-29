import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/apps/bloc/apps.dart';
import 'package:indistractable_clone/blocs/search/bloc/search.dart';

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
                color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                      .add(SearchTextChanged(value)),
                  decoration: InputDecoration(
                      hintText: "Search Apps",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: apps.length,
                    itemBuilder: (context, position) {
                      final app = apps[position];
                      return ListTile(
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
