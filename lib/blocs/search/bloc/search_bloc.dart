import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indistractable_clone/blocs/apps/bloc/apps.dart';
import 'package:indistractable_clone/blocs/search/bloc/search.dart';
import 'package:indistractable_clone/models/App.dart';
import 'package:meta/meta.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AppsBloc appsBloc;
  StreamSubscription appsSubscription;

  SearchBloc({@required this.appsBloc}) {
    appsSubscription = appsBloc.listen((state) {
      if (state is AppsLoaded) {
        add(UpdateApps((appsBloc.state as AppsLoaded).apps));
      }
    });
  }
  @override
  SearchState get initialState {
    return appsBloc.state is AppsLoaded
        ? SearchLoaded(
            sApps: (appsBloc.state as AppsLoaded).apps, searchTerm: '')
        : SearchLoading();
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchTextChanged) {
      yield* _mapSearchTextChangedToState(event);
    } else if (event is UpdateApps) {
      yield* _mapUpdateAppsToState();
    }
  }

  Stream<SearchState> _mapSearchTextChangedToState(
      SearchTextChanged event) async* {
    if (appsBloc.state is AppsLoaded) {
      yield SearchLoaded(
          sApps: _mapAppsToSearchQuery(
              (appsBloc.state as AppsLoaded).apps, event.searchTerm),
          searchTerm: event.searchTerm);
    }
  }

  Stream<SearchState> _mapUpdateAppsToState() async* {
    final searchQuery =
        state is SearchLoaded ? (state as SearchLoaded).searchTerm : '';
    yield SearchLoaded(
        sApps: _mapAppsToSearchQuery(
            (appsBloc.state as AppsLoaded).apps, searchQuery),
        searchTerm: searchQuery);
  }

  List<App> _mapAppsToSearchQuery(List<App> apps, String searchQuery) {
    return apps.where((app) {
      if (searchQuery.trim().isNotEmpty) {
        return app.appName.toLowerCase().contains(searchQuery);
      } else {
        return true;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    appsSubscription.cancel();
    return super.close();
  }
}
