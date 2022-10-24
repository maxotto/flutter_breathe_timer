import 'dart:async';

import '../timer/timer.dart';
import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
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
    _tickerPlusSubscription.cancel();
    _tickerMinusSubscription.cancel();
    return super.close();
  }

  // начальное состояние для BLoC

  // передаем сюда также 2 наших счетчика для прямого и обратного счета
  WhTimerBloc({required TickerPlus tickerPlus, required TickerMinus tickerMinus})
      : _tickerPlus = tickerPlus,
        _tickerMinus = tickerMinus,
        _tickerPlusSubscription = tickerPlus.tick().listen((duration) {}),
        _tickerMinusSubscription =
            tickerMinus.tick(ticks: 0).listen((duration) {}),
        super(WhTimerInitial(
            Phases.idle,
          Decimal.parse('0'),
          Decimal.parse('0')
      )
      ){

  }

  @override
  Stream<WhTimerState> mapEventToState(
    WhTimerEvent event,
  ) async* {
    if (event is WhTimerNextEvent) {
      yield* _mapNextToState(event);
    }
    if (event is WhTimerResetEvent) {
      _tickerPlusSubscription.cancel();
      _tickerMinusSubscription.cancel();
      yield WhTimerInitial(Phases.idle, Decimal.parse('0'), Decimal.parse('0'));
    }
    if (event is WhTimerPlusTicked) {
      yield WhTimerInFirstHold(Phases.holdOnOut,
          Decimal.fromInt(event.duration), Decimal.parse('0'));
    }
    if (event is WhTimerMinusTicked) {
      if (event.duration == 0) FlutterRingtonePlayer.playNotification();
      yield event.duration > 0
          ? WhTimerInSecondHold(Phases.holdOnIn, Decimal.parse('0'),
              Decimal.fromInt(event.duration))
          : WhTimerInBreathe(
              Phases.breathe, Decimal.parse('0'), Decimal.parse('0'));
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
        yield WhTimerInFirstHold(
            Phases.holdOnOut, Decimal.parse('0'), Decimal.parse('0'));
        // Надо начинать считать плюсовой счетчик
        // мы его прекращаем, если он все еще считает
        _tickerPlusSubscription.cancel();
        _tickerMinusSubscription.cancel();
        _tickerPlusSubscription = _tickerPlus.tick().listen((duration) {
          add(WhTimerPlusTicked(duration: duration));
        });
        break;
      case Phases.breathe:
        yield WhTimerInFirstHold(
            Phases.holdOnOut, Decimal.parse('0'), Decimal.parse('0'));
        _tickerPlusSubscription.cancel();
        _tickerMinusSubscription.cancel();
        _tickerPlusSubscription = _tickerPlus.tick().listen((duration) {
          add(WhTimerPlusTicked(duration: duration));
        });
        break;
      case Phases.holdOnOut:
        yield WhTimerInSecondHold(
            Phases.holdOnIn, Decimal.parse('0'), Decimal.parse('0'));
        // Надо начинать считать минусовой счетчик
        // мы его прекращаем, если он все еще считает
        _tickerPlusSubscription.cancel();
        _tickerMinusSubscription.cancel();
        _tickerMinusSubscription =
            _tickerMinus.tick(ticks: 15).listen((duration) {
          add(WhTimerMinusTicked(duration: duration));
        });
        break;
      case Phases.holdOnIn:
        _tickerPlusSubscription.cancel();
        _tickerMinusSubscription.cancel();
        yield WhTimerInBreathe(
            Phases.breathe, Decimal.parse('0'), Decimal.parse('0'));
        break;
    }
  }
}
