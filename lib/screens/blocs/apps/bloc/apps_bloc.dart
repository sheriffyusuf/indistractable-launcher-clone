import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apps_event.dart';
part 'apps_state.dart';

class AppsBloc extends Bloc<AppsEvent, AppsState> {
  @override
  AppsState get initialState => AppsInitial();

  @override
  Stream<AppsState> mapEventToState(
    AppsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
