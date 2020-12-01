import 'package:flutter/material.dart';

import 'counter/wh_timer.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
class WHTimerApp extends MaterialApp {
  /// {@macro counter_app}
  const WHTimerApp({Key key}) : super(key: key, home: const WHTimerPage());
}
