import 'package:learnapp/design_patterns/mvc/counter/cubit/model/cubit_model.dart';

class CounterCubitController {
  final CounterCubitModel _model;

  CounterCubitController(this._model);

  void onIncrement() => _model.increment();

  void onDecrement() => _model.decrement();
}
