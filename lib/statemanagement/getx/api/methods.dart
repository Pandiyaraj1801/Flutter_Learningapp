import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiGetxController extends GetxController {
  RxMap apiResult = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchApi();
  }

  void fetchApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        Map<String, dynamic> result = {"status": "S", "todos": todos};

        apiResult.value = result;
      } else {
        Map<String, dynamic> result = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };

        apiResult.value = result;
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "E", "errMsg": e.toString()};

      apiResult.value = result;
    }
  }
}
