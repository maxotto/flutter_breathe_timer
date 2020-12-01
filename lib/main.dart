import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  // эта штука нужна чтобы глобально отслеживать изменение состояний
  Bloc.observer = MyObserver();
  //это запуск собственно приложеньки
  runApp(const WHTimerApp());
}
