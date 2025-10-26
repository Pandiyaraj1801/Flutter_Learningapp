import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvvm/counter/getx/mvvm_countergetx_model.dart';

class MvvmCounterGetxVm extends GetxController {
  final Rx<MvvmCounterGetxModel> _model;
  RxInt updateCount = 0.obs;

  MvvmCounterGetxVm(this._model);

  int get getCount => _model.value.count;

  void increment() {
    _model.value.count++;
    updateCount.value = _model.value.count;
  }

  void decrement() {
    _model.value.count--;
    updateCount.value = _model.value.count;
  }
}
