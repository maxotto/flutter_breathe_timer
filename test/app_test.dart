// ignore_for_file: prefer_const_constructors
import 'package:WimHofTimer/app.dart';
import 'package:WimHofTimer/counter/wh_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('is a MaterialApp', (tester) async {
      expect(WHTimerApp(), isA<MaterialApp>());
    });

    testWidgets('home is CounterPage', (tester) async {
      expect(WHTimerApp().home, isA<WHTimerApp>());
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(WHTimerApp());
      expect(find.byType(WHTimerApp), findsOneWidget);
    });
  });
}
