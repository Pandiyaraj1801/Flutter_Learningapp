import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_event.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_state.dart';

class CounterBlocScreen extends StatefulWidget {
  const CounterBlocScreen({super.key});

  @override
  State<CounterBlocScreen> createState() => _CounterBlocScreenState();
}

class _CounterBlocScreenState extends State<CounterBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.count.toString()),
                IconButton(
                  onPressed: () => BlocProvider.of<CounterBloc>(
                    context,
                  ).add(CounterIncrementEvent()),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(
                      context,
                    ).add(CounterDecrementEvent());
                  },
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
