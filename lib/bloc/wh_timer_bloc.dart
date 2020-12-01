import 'dart:async';

import 'package:WimHofTimer/timer/timer.dart';
import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'wh_timer_event.dart';
part 'wh_timer_state.dart';

class WhTimerBloc extends Bloc<WhTimerEvent, WhTimerState> {
  final TickerMinus _tickerMinus;
  final TickerPlus _tickerPlus;
  StreamSubscription<int> _tickerPlusSubscription;
  StreamSubscription<int> _tickerMinusSubscription;

  // чтобы при закрытии блока автоматом закрывались и счетчики
  @override
  Future<void> close() {
    _tickerPlusSubscription?.cancel();
    _tickerMinusSubscription?.cancel();
    return super.close();
  }

  // начальное состояние для BLoC

  // передаем сюда также 2 наших счетчика для прямого и обратного счета
  WhTimerBloc(
      {@required TickerPlus tickerPlus, @required TickerMinus tickerMinus})
      : assert(tickerPlus != null),
        assert(tickerMinus != null),
        _tickerPlus = tickerPlus,
        _tickerMinus = tickerMinus,
        super(WhTimerInitial(
            Phases.idle, Decimal.parse('0'), Decimal.parse('0')));

  @override
  Stream<WhTimerState> mapEventToState(
    WhTimerEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is WhTimerNextEvent) {
      yield* _mapNextToState(event);
    }
    if (event is WhTimerResetEvent) {
      yield WhTimerInitial(Phases.idle, Decimal.parse('0'), Decimal.parse('0'));
    }
  }

  Stream<WhTimerState> _mapNextToState(WhTimerNextEvent nextEvent) async* {
    print('nextEvent');
    print(nextEvent.currentState);
    // тут надо понять, где мы сейчас. В зависимости от этого оп разному назначать состояния и запускать разные счетчики.
    Phases currentPhase = nextEvent.currentState.phase;
    print(currentPhase);
    switch (currentPhase) {
      case Phases.idle:
        print('goto from IDLE');
        yield WhTimerInFirstHold(
            Phases.holdOnOut, Decimal.parse('0'), Decimal.parse('0'));
        break;
      case Phases.breathe:
        print('goto from BREATHE');
        yield WhTimerInFirstHold(
            Phases.holdOnOut, Decimal.parse('0'), Decimal.parse('0'));
        break;
      case Phases.holdOnOut:
        print('goto from HOLD ON OUT');
        yield WhTimerInSecondHold(
            Phases.holdOnIn, Decimal.parse('0'), Decimal.parse('0'));
        break;
      case Phases.holdOnIn:
        print('goto from HOLD ON IN');
        yield WhTimerInBreathe(
            Phases.breathe, Decimal.parse('0'), Decimal.parse('0'));
        break;
    }
  }
}
