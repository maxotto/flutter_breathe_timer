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

class WhTimerPlusTicked extends WhTimerEvent {
  final int duration;

  const WhTimerPlusTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "WhTimerPlusTicked { duration: $duration }";
}

class WhTimerMinusTicked extends WhTimerEvent {
  final int duration;

  const WhTimerMinusTicked({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "WhTimerMinusTicked { duration: $duration }";
}
