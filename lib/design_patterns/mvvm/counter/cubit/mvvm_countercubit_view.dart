import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/mvvm/counter/cubit/mvvm_countercubit_vm.dart';

class MvvmCounterCubitView extends StatefulWidget {
  const MvvmCounterCubitView({super.key});

  @override
  State<MvvmCounterCubitView> createState() => _MvvmCounterCubitViewState();
}

class _MvvmCounterCubitViewState extends State<MvvmCounterCubitView> {
  late MvvmCounterCubitVm _counterCubitVm;

  @override
  void initState() {
    super.initState();
    _counterCubitVm = BlocProvider.of<MvvmCounterCubitVm>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MvvmCounterCubitVm, MvvmCounterState>(
              builder: (context, state) {
                return Text(state.model.count.toString());
              },
            ),
            IconButton(
              onPressed: () => _counterCubitVm.increment(),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _counterCubitVm.decrement(),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
