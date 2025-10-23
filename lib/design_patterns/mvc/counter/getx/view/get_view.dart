import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvc/counter/getx/controller/get_controller.dart';
import 'package:learnapp/design_patterns/mvc/counter/getx/model/get_model.dart';

class GetCounterView extends StatefulWidget {
  const GetCounterView({super.key});

  @override
  State<GetCounterView> createState() => _GetCounterViewState();
}

class _GetCounterViewState extends State<GetCounterView> {
  final GetCounterModel _model = GetCounterModel(0.obs);
  late GetCounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetCounterController(_model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(_model.count.toString())),
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
