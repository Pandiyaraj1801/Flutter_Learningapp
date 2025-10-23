import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetxApiModel {
  int userId;
  int id;
  String title;
  bool completed;

  GetxApiModel(this.userId, this.id, this.title, this.completed);

  factory GetxApiModel.fromJson(Map<String, dynamic> json) {
    return GetxApiModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}

class MvcGetxApiModel extends GetxController {
  RxMap apiResult;

  MvcGetxApiModel(this.apiResult);

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        List<GetxApiModel> apiModel = todos
            .map((json) => GetxApiModel.fromJson(json))
            .toList();

        apiResult.value = {"status": "S", "todos": apiModel};
      } else {
        apiResult.value = {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      apiResult.value = {"status": "E", "errMsg": e.toString()};
    }
  }
}
