import 'dart:convert';
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

  static Future<Map<String, dynamic>> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        List<MvcApiModel> apiModel = todos
            .map((json) => MvcApiModel.fromJson(json))
            .toList();

        return {"status": "S", "todos": apiModel};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }
}
