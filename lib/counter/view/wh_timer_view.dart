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
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: BlocBuilder<WhTimerBloc, WhTimerState>(
            builder: (context, state) {
              return Text('$state');
            },
          ),
        ),
        BlocBuilder<WhTimerBloc, WhTimerState>(
          buildWhen: (previousState, state) =>
              state.runtimeType != previousState.runtimeType,
          builder: (context, state) => Actions(),
        ),
        /*
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              key: const Key('counterView_next_floatingActionButton'),
              child: const Icon(Icons.navigate_next_rounded),
              onPressed: () =>
                  context.read<WhTimerBloc>().add(WhTimerNextEvent()),
            ),
            FloatingActionButton(
              key: const Key('counterView_reset_floatingActionButton'),
              child: const Icon(Icons.reset_tv),
              onPressed: () =>
                  context.read<WhTimerBloc>().add(WhTimerResetEvent()),
            ),
          ],
        ),*/
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
