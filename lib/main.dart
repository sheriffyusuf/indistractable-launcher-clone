import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:indistractable_clone/blocs/battery/bloc/battery_bloc.dart';
import 'package:indistractable_clone/blocs/battery_level/bloc/battery_level_bloc.dart';
import 'package:indistractable_clone/blocs/preferences/bloc/prefs_bloc.dart';
import 'package:indistractable_clone/blocs/search/bloc/search.dart';
import 'package:indistractable_clone/routes.dart';
import 'package:indistractable_clone/blocs/apps/bloc/apps.dart';
import 'package:indistractable_clone/screens/launcher_base_screen.dart';
import 'package:indistractable_clone/theme/style.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate(
    await HydratedBlocStorage.getInstance(),
  );
  runApp(LauncherApp());
}

class LauncherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: <AppTheme>[
        blackAppTheme(),
        AppTheme.light().copyWith(
            id: "white_theme",
            data: ThemeData(
                accentColor: Colors.black,
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                dialogBackgroundColor: Color(0xFFdddddd))),
        AppTheme.dark()
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppsBloc>(
            create: (context) => AppsBloc()..add(AppsLoadSuccess()),
          ),
          BlocProvider<BatteryBloc>(
            create: (context) => BatteryBloc()..add(LoadBattery()),
          ),
          BlocProvider<BatteryLevelBloc>(
            create: (context) => BatteryLevelBloc(),
          ),
          BlocProvider<PrefsBloc>(
            create: (context) => PrefsBloc(),
          )
        ],
        child: BlocProvider<SearchBloc>(
          create: (context) =>
              SearchBloc(appsBloc: BlocProvider.of<AppsBloc>(context)),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Indistractable",
            color: Colors.white,
            home: ThemeConsumer(
              child: LauncherBaseScreen(),
            ),
            routes: routes,
          ),
        ),
      ),
    );
  }
}

class SimpleBlocDelegate extends HydratedBlocDelegate {
  SimpleBlocDelegate(HydratedStorage storage) : super(storage);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
