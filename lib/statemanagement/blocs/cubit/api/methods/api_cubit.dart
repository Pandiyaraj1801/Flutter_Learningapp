import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiState {
  Map<String, dynamic> userList;

  ApiState(this.userList);
}

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiState({}));

  void getApi() {
    http
        .get(
          Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
          headers: {"Content-Type": "application/json"},
        )
        .then((res) {
          if (res.statusCode == 200) {
            emit(ApiState({"status": "S", "userList": jsonDecode(res.body)}));
          } else {
            emit(ApiState({"status": "E", "errMsg": jsonDecode(res.body)}));
          }
        })
        .catchError((err) {
          emit(ApiState({"status": "E", "errMsg": err.toString()}));
        });
  }
}
