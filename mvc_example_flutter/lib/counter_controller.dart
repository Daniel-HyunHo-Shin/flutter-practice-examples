import 'counter_model.dart';

class CounterController {
  final CounterModel _model = CounterModel();

  void increment() {
    _model.increment();
  }

  void decrement() {
    _model.decrement();
  }

  int get count => _model.count;
}
