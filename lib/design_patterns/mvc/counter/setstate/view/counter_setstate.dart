import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvc/counter/setstate/controller/counter_controller.dart';
import 'package:learnapp/design_patterns/mvc/counter/setstate/model/counter_model.dart';

class CounterSetStateScreen extends StatefulWidget {
  const CounterSetStateScreen({super.key});

  @override
  State<CounterSetStateScreen> createState() => _CounterSetStateScreenState();
}

class _CounterSetStateScreenState extends State<CounterSetStateScreen> {
  late CounterController _controller;
  final CounterModel _model = CounterModel(0);

  @override
  void initState() {
    super.initState();
    _controller = CounterController(_model, () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_model.count.toString()),
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
