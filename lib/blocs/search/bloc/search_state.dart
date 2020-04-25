import 'package:equatable/equatable.dart';
import 'package:indistractable_clone/models/App.dart';
import 'package:meta/meta.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<App> sApps;
  final String searchTerm;

  const SearchLoaded({@required this.sApps, @required this.searchTerm});

  @override
  List<Object> get props => [sApps, searchTerm];
}
