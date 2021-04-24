// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Step 1:\n Do 30-40 Deep Breaths`
  String get step1 {
    return Intl.message(
      'Step 1:\n Do 30-40 Deep Breaths',
      name: 'step1',
      desc: 'Step 1',
      args: [],
    );
  }

  /// `Step 2:\nThe Hold. Let the air out and stop breathing`
  String get step2 {
    return Intl.message(
      'Step 2:\nThe Hold. Let the air out and stop breathing',
      name: 'step2',
      desc: 'Step 2',
      args: [],
    );
  }

  /// `Step 3:\nDraw one big breath to fill your lungs. Hold the breath for 15 seconds`
  String get step3 {
    return Intl.message(
      'Step 3:\nDraw one big breath to fill your lungs. Hold the breath for 15 seconds',
      name: 'step3',
      desc: 'Step 3',
      args: [],
    );
  }

  /// `Breath timer`
  String get appTitle {
    return Intl.message(
      'Breath timer',
      name: 'appTitle',
      desc: 'App Title',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}