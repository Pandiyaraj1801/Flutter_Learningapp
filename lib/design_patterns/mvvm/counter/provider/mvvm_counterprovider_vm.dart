import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/counter/provider/mvvm_counterprovider_model.dart';

class MvvmCounterProviderVm extends ChangeNotifier {
  final MvvmCounterProviderModel _model;

  MvvmCounterProviderVm(this._model);

  int get getCount => _model.count;

  void increment() {
    _model.count++;
    notifyListeners();
  }

  void decrement() {
    _model.count--;
    notifyListeners();
  }
}
