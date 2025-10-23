import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitModelState {
  int count;

  CounterCubitModelState(this.count);
}

class CounterCubitModel extends Cubit<CounterCubitModelState> {
  CounterCubitModel() : super(CounterCubitModelState(0));

  void increment() => emit(CounterCubitModelState(state.count + 1));

  void decrement() => emit(CounterCubitModelState(state.count - 1));
}
