import 'package:learnapp/design_patterns/mvc/counter/getx/model/get_model.dart';

class GetCounterController {
  final GetCounterModel _model;

  GetCounterController(this._model);

  void onIncrement() => _model.increment();

  void onDecrement() => _model.decrement();
}
