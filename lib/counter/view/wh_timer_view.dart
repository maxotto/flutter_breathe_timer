import 'dart:async';

import 'package:WimHofTimer/bloc/wh_timer_bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../wh_timer.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class WHTimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: BlocBuilder<WhTimerBloc, WhTimerState>(
            builder: (context, state) {
              String message = "Message";
              String startCount = '0';
              switch (state.phase) {
                case Phases.idle:
                  message = 'Step 1:\n Do 30-40 Deep Breaths';
                  startCount = '';
                  break;
                case Phases.holdOnOut:
                  message =
                      'Step 2:\nThe Hold. Let the air out and stop breathing';
                  break;
                case Phases.holdOnIn:
                  message =
                      'Step 3:\nDraw one big breath to fill your lungs. Hold the breath for 15 seconds';
                  startCount = '15';
                  break;
                case Phases.breathe:
                  message = 'Step 1:\n30-40 Deep Breaths';
                  startCount = '';
                  break;
              }
              return Column(children: [
                SizedBox(
                  height: 110,
                ),
                SizedBox(
                  height: 190,
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 40,
                  child: state.holdOnOutDuration > Decimal.zero
                      ? Text(state.holdOnOutDuration.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]))
                      : (state.holdOnInDuration > Decimal.zero
                          ? Text(state.holdOnInDuration.toString(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]))
                          : Text(startCount,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ))),
                ),
                SizedBox(
                  height: 30,
                ),
              ]);
            },
          ),
        ),
        BlocBuilder<WhTimerBloc, WhTimerState>(
          buildWhen: (previousState, state) =>
              state.runtimeType != previousState.runtimeType,
          builder: (context, state) => Actions(),
        ),
      ],
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        whTimerBloc: BlocProvider.of<WhTimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    WhTimerBloc whTimerBloc,
  }) {
    final WhTimerState currentState = whTimerBloc.state;
    final _resetButton = FloatingActionButton(
      child: Icon(Icons.reset_tv),
      onPressed: () =>
          whTimerBloc.add(WhTimerResetEvent(currentState: currentState)),
    );

    print(currentState.toString());
    if (currentState is WhTimerInitial) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              whTimerBloc.add(WhTimerNextEvent(currentState: currentState)),
        ),
      ];
    }
    if (currentState is WhTimerInFirstHold) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              whTimerBloc.add(WhTimerNextEvent(currentState: currentState)),
        ),
        SizedBox(height: 10),
        _resetButton,
      ];
    }
    if (currentState is WhTimerInSecondHold) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              whTimerBloc.add(WhTimerNextEvent(currentState: currentState)),
        ),
        SizedBox(height: 10),
        _resetButton,
      ];
    }
    if (currentState is WhTimerInBreathe) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              whTimerBloc.add(WhTimerNextEvent(currentState: currentState)),
        ),
        SizedBox(height: 10),
        _resetButton,
      ];
    }
    return [];
  }
}
