import 'package:flutter/material.dart';

class ProviderCounterModel extends ChangeNotifier {
  int count;

  ProviderCounterModel(this.count);

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
