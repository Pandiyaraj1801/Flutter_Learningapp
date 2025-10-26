import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/counter/provider/mvvm_counterprovider_vm.dart';
import 'package:provider/provider.dart';

class MvvmCounterProviderView extends StatefulWidget {
  const MvvmCounterProviderView({super.key});

  @override
  State<MvvmCounterProviderView> createState() =>
      _MvvmCounterProviderViewState();
}

class _MvvmCounterProviderViewState extends State<MvvmCounterProviderView> {
  late MvvmCounterProviderVm _counterProviderVm;

  @override
  Widget build(BuildContext context) {
    _counterProviderVm = Provider.of<MvvmCounterProviderVm>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_counterProviderVm.getCount.toString()),
            IconButton(
              onPressed: () => _counterProviderVm.increment(),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _counterProviderVm.decrement(),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
