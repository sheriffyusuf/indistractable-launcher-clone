import 'package:equatable/equatable.dart';
import 'package:indistractable_clone/models/App.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTextChanged extends SearchEvent {
  final String searchTerm;
  const SearchTextChanged(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

class UpdateApps extends SearchEvent {
  final List<App> apps;

  const UpdateApps(this.apps);

  @override
  List<Object> get props => [apps];
}
