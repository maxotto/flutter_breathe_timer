import 'package:breath_timer/bloc/wh_timer_bloc.dart';
import 'package:breath_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:breath_timer/generated/l10n.dart';
import '../wh_timer.dart';
import 'wh_timer_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class WHTimerPage extends StatelessWidget {
  /// {@macro counter_page}
  const WHTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).appTitle)),
      body: Stack(
        children: [
          Background(),
          BlocProvider(
            create: (_) => WhTimerBloc(
                tickerPlus: TickerPlus(), tickerMinus: TickerMinus()),
            child: WHTimerView(),
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(184, 189, 245, 0.7)
          ],
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(172, 182, 219, 0.7)
          ],
          [
            Color.fromRGBO(72, 73, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(190, 238, 246, 0.7)
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 45,
      backgroundColor: Colors.blue[250],
    );
  }
}
