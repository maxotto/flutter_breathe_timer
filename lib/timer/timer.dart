class TickerPlus {
  Stream<int> tick() {
    return Stream.periodic(Duration(seconds: 1), (x) => x);
  }
}

class TickerMinus {
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
