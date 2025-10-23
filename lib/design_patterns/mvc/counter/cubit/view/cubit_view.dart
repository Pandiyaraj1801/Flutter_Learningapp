import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/mvc/counter/cubit/controller/cubit_controller.dart';
import 'package:learnapp/design_patterns/mvc/counter/cubit/model/cubit_model.dart';

class CounterCubitView extends StatefulWidget {
  const CounterCubitView({super.key});

  @override
  State<CounterCubitView> createState() => _CounterCubitViewState();
}

class _CounterCubitViewState extends State<CounterCubitView> {
  late CounterCubitModel _model;
  late CounterCubitController _controller;

  @override
  void initState() {
    super.initState();
    _model = BlocProvider.of<CounterCubitModel>(context);
    _controller = CounterCubitController(_model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubitModel, CounterCubitModelState>(
              builder: (context, state) {
                return Text(state.count.toString());
              },
            ),
            IconButton(
              onPressed: () => _controller.onIncrement(),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _controller.onDecrement(),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
