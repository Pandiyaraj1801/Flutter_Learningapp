import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvc/counter/setstate/model/counter_model.dart';

class CounterController {
  final CounterModel _model;
  final VoidCallback _callBack;

  CounterController(this._model, this._callBack);

  void onIncrement() {
    _model.increment();
    _callBack();
  }

  void onDecrement() {
    _model.decrement();
    _callBack();
  }
}
