import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/statemanagement/getx/counter/methods.dart';

class CounterGetxScreen extends StatefulWidget {
  const CounterGetxScreen({super.key});

  @override
  State<CounterGetxScreen> createState() => _CounterGetxScreenState();
}

class _CounterGetxScreenState extends State<CounterGetxScreen> {
  final controller = Get.put(CounterGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(controller.count.toString()),
              IconButton(
                onPressed: () => controller.increment(),
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () => controller.decrement(),
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      }),
    );
  }
}
