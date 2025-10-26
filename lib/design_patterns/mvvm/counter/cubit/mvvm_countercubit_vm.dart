import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/mvvm/counter/cubit/mvvm_countercubit_model.dart';

class MvvmCounterState {
  final MvvmCounterCubitModel model;

  MvvmCounterState(this.model);
}

class MvvmCounterCubitVm extends Cubit<MvvmCounterState> {
  MvvmCounterCubitVm() : super(MvvmCounterState(MvvmCounterCubitModel(0)));

  void increment() {
    emit(MvvmCounterState(MvvmCounterCubitModel(state.model.count + 1)));
  }

  void decrement() {
    emit(MvvmCounterState(MvvmCounterCubitModel(state.model.count - 1)));
  }
}
