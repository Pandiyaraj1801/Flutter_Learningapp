import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_event.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementEvent>(
      (event, emit) => emit(CounterState(state.count + 1)),
    );

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}
