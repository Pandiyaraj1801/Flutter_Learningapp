import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/counter/setstate/mvvm_counter_model.dart';

class MvvmCounterVm {
  final MvvmCounterModel _counterModel;
  final VoidCallback _callBack;

  MvvmCounterVm(this._counterModel, this._callBack);

  int get count => _counterModel.count;

  void increment() {
    _counterModel.count++;
    _callBack();
  }

  void decrement() {
    _counterModel.count--;
    _callBack();
  }
}
