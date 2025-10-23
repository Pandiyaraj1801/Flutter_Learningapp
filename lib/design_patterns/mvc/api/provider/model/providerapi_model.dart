import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderApiModel {
  int userId;
  int id;
  String title;
  bool completed;

  ProviderApiModel(this.userId, this.id, this.title, this.completed);

  factory ProviderApiModel.fromJson(Map<String, dynamic> json) {
    return ProviderApiModel(
      json["userId"],
      json["id"],
      json["title"],
      json["completed"],
    );
  }
}

class MvcProviderApiModel extends ChangeNotifier {
  Map<String, dynamic> apiResult;

  MvcProviderApiModel(this.apiResult);

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        List<ProviderApiModel> apiModel = todos
            .map((json) => ProviderApiModel.fromJson(json))
            .toList();

        apiResult = {"status": "S", "todos": apiModel};
      } else {
        apiResult = {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      apiResult = {"status": "E", "errMsg": e.toString()};
    }

    notifyListeners();
  }
}
