import 'package:get/get.dart';

class CounterGetxController extends GetxController {
  RxInt count = 0.obs;

  void increment() => count.value++;

  void decrement() => count.value--;
}
