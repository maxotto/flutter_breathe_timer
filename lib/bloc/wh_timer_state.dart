part of 'wh_timer_bloc.dart';

enum Phases { idle, breathe, holdOnOut, holdOnIn }

@immutable
abstract class WhTimerState extends Equatable {
  final Phases phase;
  final Decimal holdOnOutDuration;
  final Decimal holdOnInDuration;

  const WhTimerState(this.phase, this.holdOnOutDuration, this.holdOnInDuration);

  @override
  List<Object> get props => [phase, holdOnOutDuration, holdOnInDuration];
}

class WhTimerInitial extends WhTimerState {
  const WhTimerInitial(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerInitial {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}

class WhTimerInBreathe extends WhTimerState {
  const WhTimerInBreathe(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerInBreathe {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}

class WhTimerInFirstHold extends WhTimerState {
  const WhTimerInFirstHold(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerInFirstHold {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}

class WhTimerInSecondHold extends WhTimerState {
  const WhTimerInSecondHold(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerInSecondHold {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}

class WhTimerFinished extends WhTimerState {
  const WhTimerFinished(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerFinished {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}

class WhTimerPlusTimerInProgress extends WhTimerState {
  const WhTimerPlusTimerInProgress(
      Phases phase, Decimal holdOnOutDuration, Decimal holdOnInDuration)
      : super(phase, holdOnOutDuration, holdOnInDuration);

  @override
  String toString() =>
      'WhTimerPlusTimerInProgress {Phase: $phase, hold duration on out: $holdOnOutDuration, hold duration on in: $holdOnInDuration}';
}
