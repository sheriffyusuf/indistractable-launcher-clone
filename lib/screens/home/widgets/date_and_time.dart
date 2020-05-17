import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/preferences/bloc/prefs_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timer_builder/timer_builder.dart';

class DateTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (_) {
      var now = DateTime.now();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlocBuilder<PrefsBloc, PrefsState>(
            builder: (context, state) => Text(
              state.is12hourTime
                  ? Jiffy(now).format('h:mm a')
                  : Jiffy(now).format('H:mm'),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 12),
          Text(
            Jiffy(now).format('EEEE, do MMMM'),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12),
          ),
        ],
      );
    });
  }
}
