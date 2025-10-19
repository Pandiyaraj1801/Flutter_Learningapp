import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/cubit/counter/methods/counter_cubit.dart';

class CounterCubitScreen extends StatefulWidget {
  const CounterCubitScreen({super.key});

  @override
  State<CounterCubitScreen> createState() => _CounterCubitScreenState();
}

class _CounterCubitScreenState extends State<CounterCubitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.count.toString()),
                IconButton(
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).increment(),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).decrement(),
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
