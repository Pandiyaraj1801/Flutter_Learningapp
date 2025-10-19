import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void incrementFunc() {
    count++;

    notifyListeners();
  }

  void decrement() {
    count--;

    notifyListeners();
  }
}
