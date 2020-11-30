import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wh_timer_event.dart';
part 'wh_timer_state.dart';

class WhTimerBloc extends Bloc<WhTimerEvent, WhTimerState> {
  WhTimerBloc() : super(WhTimerInitial());

  @override
  Stream<WhTimerState> mapEventToState(
    WhTimerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
