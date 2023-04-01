class CounterModel {
  int count = 0;

  CounterModel({this.count = 0});

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
