import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/event.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/state.dart';
import 'package:http/http.dart' as http;

class ApiBloc extends Bloc<ApiBlocEvent, ApiBlocState> {
  ApiBloc() : super(ApiInitialState()) {
    on<ApiInitialEvent>(fetchApi);
  }

  Future<void> fetchApi(ApiInitialEvent evnet, Emitter emit) async {
    emit(ApiInitialState());

    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );
      if (response.statusCode == 200) {
        List todos = jsonDecode(response.body);
        Map<String, dynamic> result = {"status": "S", "todos": todos};

        emit(ApiSuccessState(result));
      } else {
        Map<String, dynamic> errResp = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };

        emit(ApiFailureState(errResp));
      }
    } catch (e) {
      Map<String, dynamic> errResp = {"status": "E", "errMsg": e.toString()};

      emit(ApiFailureState(errResp));
    }
  }
}
