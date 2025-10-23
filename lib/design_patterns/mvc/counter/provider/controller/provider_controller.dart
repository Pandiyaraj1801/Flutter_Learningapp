import 'package:learnapp/design_patterns/mvc/counter/provider/model/provider_model.dart';

class ProviderCounterController {
  final ProviderCounterModel _model;

  ProviderCounterController(this._model);

  void onIncrement() => _model.increment();

  void onDecrement() => _model.decrement();
}
