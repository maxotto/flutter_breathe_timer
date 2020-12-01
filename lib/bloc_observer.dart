import 'package:bloc/bloc.dart';

/// {@template counter_observer}
/// [BlocObserver] for the counter application which
/// observes all [Cubit] state changes.
/// {@endtemplate}
class MyObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('Observer talks: ${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Observer talks: ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
