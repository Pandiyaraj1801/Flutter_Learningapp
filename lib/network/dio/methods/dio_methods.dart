import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:learnapp/network/dio/models/user_models.dart';

class DioRequests {
  static const String url = "https://jsonplaceholder.typicode.com/todos/";
  static Dio dio = Dio();

  // ============ GetApi =================
  static Future<Map<String, dynamic>> getApi() async {
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        List<UserDetails> userDetails = userDetailsFromJson(
          jsonEncode(response.data),
        );

        return {"status": "S", "userList": userDetails};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.data)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ============= PostApi ==================
  static Future<Map<String, dynamic>> postApi() async {
    try {
      Response response = await dio.post(
        url,
        options: Options(headers: {"Content-Type": "application/json"}),
        data: {"name": "kalaiselvi", "age": 23},
      );

      if (response.statusCode == 201) {
        return {"status": "S", "msg": "Inserted Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.data)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ================= PutApi =====================
  static Future<Map<String, dynamic>> putApi() async {
    try {
      Response response = await dio.put(
        "$url/1",
        options: Options(headers: {"Content-Type": "applicatio/json"}),
        data: {"name": "kalaiselvi", "age": 23, "hubandname": "pandiyaraj"},
      );

      if (response.statusCode == 200) {
        return {"status": "S", "msg": "Updated Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.data)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }

  // ================ DeleteApi ===================
  static Future<Map<String, dynamic>> deleteApi() async {
    try {
      Response response = await dio.delete(
        "$url/2",
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        return {"status": "S", "msg": "Deleted Successfully"};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.data)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }
}
