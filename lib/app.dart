import 'package:flutter/material.dart';

import 'counter/wh_timer.dart';

import 'package:WimHofTimer/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
///

List<Locale> sl = S.delegate.supportedLocales;

class WHTimerApp extends MaterialApp {
  /// {@macro counter_app}

  const WHTimerApp({Key key})
      : super(
          key: key,
          home: const WHTimerPage(),
          localizationsDelegates: const [
            // 1
            S.delegate,
            // 2
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            const Locale('ru', 'RU'),
            const Locale('en', 'US')
          ],
        );
}
