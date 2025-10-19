import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learnapp/network/http/models/user_models.dart';

class HttpRequests {
  static const String url = "https://jsonplaceholder.typicode.com/todos/";

  // ============== GetApi ================
  static Future<Map<String, dynamic>> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        List<UserDetails> usersList = userDetailsFromJson(response.body);
        return {"status": "S", "usersList": usersList};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ================ PostApi =================
  static Future<Map<String, dynamic>> postApi() async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": "kalaiselvi", "age": 23}),
      );

      if (response.statusCode == 201) {
        return {"status": "S", "msg": "Inserted Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ================= PutApi ================
  static Future<Map<String, dynamic>> putApi() async {
    try {
      http.Response response = await http.put(
        Uri.parse("$url/1"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "kalaiselvi",
          "age": 23,
          "husbandname": "pandiyaraj",
        }),
      );

      if (response.statusCode == 200) {
        return {"status": "S", "msg": "Updated Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ================= DeleteApi =================
  static Future<Map<String, dynamic>> deleteApi() async {
    try {
      http.Response response = await http.delete(
        Uri.parse("$url/2"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return {"status": "S", "msg": "Deleted Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }
}
