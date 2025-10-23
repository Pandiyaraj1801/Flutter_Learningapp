import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvc/counter/provider/controller/provider_controller.dart';
import 'package:learnapp/design_patterns/mvc/counter/provider/model/provider_model.dart';
import 'package:provider/provider.dart';

class MvcProviderCounterScreen extends StatefulWidget {
  const MvcProviderCounterScreen({super.key});

  @override
  State<MvcProviderCounterScreen> createState() =>
      _MvcProviderCounterScreenState();
}

class _MvcProviderCounterScreenState extends State<MvcProviderCounterScreen> {
  late ProviderCounterModel _model;
  late ProviderCounterController _controller;

  @override
  Widget build(BuildContext context) {
    _model = Provider.of<ProviderCounterModel>(context);
    _controller = ProviderCounterController(_model);

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
