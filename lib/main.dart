import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'counter_observer.dart';

void main() {
  // эта штука нужна чтобы глобально отслеживать изменение состояний
  Bloc.observer = CounterObserver();
  //это запуск собственно приложеньки
  runApp(const CounterApp());
}
