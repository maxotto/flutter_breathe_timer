class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(milliseconds: 100), (x) => ticks + x)
        .take(ticks);
  }
}
