import 'package:get/get.dart';

class GetCounterModel extends GetxController {
  final RxInt count;

  GetCounterModel(this.count);

  void increment() => count.value++;

  void decrement() => count.value--;
}
