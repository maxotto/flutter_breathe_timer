import 'package:bloc/bloc.dart';

/// {@template counter_observer}
/// [BlocObserver] for the counter application which
/// observes all [Cubit] state changes.
/// {@endtemplate}
class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('Observer talks: ${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Observer talks: ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
