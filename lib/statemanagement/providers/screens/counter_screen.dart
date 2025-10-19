import 'package:flutter/material.dart';
import 'package:learnapp/statemanagement/providers/methods/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _MyCounterScreen();
}

class _MyCounterScreen extends State<CounterScreen> {
  @override
  Widget build(BuildContext conttext) {
    return Scaffold(
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value.count.toString()),
                IconButton(
                  onPressed: () => value.incrementFunc(),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => value.decrement(),
                  icon: Icon(Icons.ad_units),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
