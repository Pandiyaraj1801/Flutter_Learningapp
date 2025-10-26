import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/counter/setstate/mvvm_counter_model.dart';
import 'package:learnapp/design_patterns/mvvm/counter/setstate/mvvm_counter_vm.dart';

class MvvmCounterView extends StatefulWidget {
  const MvvmCounterView({super.key});

  @override
  State<MvvmCounterView> createState() => _MvvmCounterViewState();
}

class _MvvmCounterViewState extends State<MvvmCounterView> {
  final MvvmCounterModel _model = MvvmCounterModel(0);
  late MvvmCounterVm _counterVm;

  @override
  void initState() {
    super.initState();
    _counterVm = MvvmCounterVm(_model, () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_counterVm.count.toString()),
            IconButton(
              onPressed: () => _counterVm.increment(),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _counterVm.decrement(),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
