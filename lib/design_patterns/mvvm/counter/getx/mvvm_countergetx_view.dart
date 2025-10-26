import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvvm/counter/getx/mvvm_countergetx_model.dart';
import 'package:learnapp/design_patterns/mvvm/counter/getx/mvvm_countergetx_vm.dart';

class MvvmCounterGetxView extends StatefulWidget {
  const MvvmCounterGetxView({super.key});

  @override
  State<MvvmCounterGetxView> createState() => _MvvmCounterGetxViewState();
}

class _MvvmCounterGetxViewState extends State<MvvmCounterGetxView> {
  final Rx<MvvmCounterGetxModel> _model = Rx(MvvmCounterGetxModel(0));
  late MvvmCounterGetxVm _counterGetxVm;

  @override
  void initState() {
    super.initState();
    _counterGetxVm = Get.put(MvvmCounterGetxVm(_model));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(_counterGetxVm.updateCount.toString());
            }),
            IconButton(
              onPressed: () => _counterGetxVm.increment(),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _counterGetxVm.decrement(),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
