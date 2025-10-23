import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MvcApiModel {
  int userId;
  int id;
  String title;
  bool completed;

  MvcApiModel(this.userId, this.id, this.title, this.completed);

  factory MvcApiModel.fromJson(Map<String, dynamic> json) {
    return MvcApiModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}

class MvcApiState {
  Map<String, dynamic> apiResult;

  MvcApiState(this.apiResult);
}

class MvcApiCubitModel extends Cubit<MvcApiState> {
  MvcApiCubitModel() : super(MvcApiState({}));

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        List<MvcApiModel> apiModel = todos
            .map((json) => MvcApiModel.fromJson(json))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": apiModel};

        emit(MvcApiState(result));
      } else {
        Map<String, dynamic> result = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };
        emit(MvcApiState(result));
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "E", "errMsg": e.toString()};
      emit(MvcApiState(result));
    }
  }
}
