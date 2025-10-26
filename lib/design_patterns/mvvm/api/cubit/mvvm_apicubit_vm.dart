import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learnapp/design_patterns/mvvm/api/cubit/mvvm_apicubit_model.dart';

class MvvmApiState {}

class MvvmApiInitialState extends MvvmApiState {}

class MvvmApiLoadingState extends MvvmApiState {}

class MvvmApiSuccesState extends MvvmApiState {
  Map<String, dynamic> apiResult;

  MvvmApiSuccesState(this.apiResult);
}

class MvvmApiFailureState extends MvvmApiState {
  Map<String, dynamic> apiResult;

  MvvmApiFailureState(this.apiResult);
}

class MvvmApicubitVm extends Cubit<MvvmApiState> {
  MvvmApicubitVm() : super(MvvmApiInitialState());

  Future<void> getApi() async {
    emit(MvvmApiLoadingState());

    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> decode = await jsonDecode(response.body);
        List<MvvmApiCubitModel> model = decode
            .map((json) => MvvmApiCubitModel.fromJson(json))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": model};
        emit(MvvmApiSuccesState(result));
      } else {
        Map<String, dynamic> result = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };
        emit(MvvmApiSuccesState(result));
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "E", "errMsg": e.toString()};
      emit(MvvmApiSuccesState(result));
    }
  }
}
