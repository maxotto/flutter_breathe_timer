import 'package:bloc/bloc.dart';

enum WHTimerEvent { stop, reset, next }

class CounterBloc extends Bloc<WHTimerEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(WHTimerEvent event) async* {
    switch (event) {
      case WHTimerEvent.stop:
        yield state - 1;
        break;
      case WHTimerEvent.reset:
        yield state + 1;
        break;
      case WHTimerEvent.next:
        yield state + 1;
        break;
    }
  }
}
