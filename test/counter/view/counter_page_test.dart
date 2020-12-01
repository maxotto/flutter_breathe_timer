// ignore_for_file: prefer_const_constructors
import 'package:WimHofTimer/counter/wh_timer.dart';
import 'package:WimHofTimer/counter/view/wh_timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
