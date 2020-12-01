part of 'wh_timer_bloc.dart';

@immutable
abstract class WhTimerEvent extends Equatable {
  const WhTimerEvent();

  @override
  List<Object> get props => [];
}

class WhTimerNextEvent extends WhTimerEvent {
  final WhTimerState currentState;

  const WhTimerNextEvent({@required this.currentState});

  @override
  String toString() => 'WhTimerNextEvent {currentState = $currentState}';
}

class WhTimerResetEvent extends WhTimerEvent {
  final WhTimerState currentState;

  const WhTimerResetEvent({@required this.currentState});

  @override
  String toString() => 'WhTimerResetEvent {currentState = $currentState}';
}
