import 'dart:convert';
import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvvm/api/getx/mvvm_apigetx_model.dart';
import 'package:http/http.dart' as http;

class MvvmApiGetxVm extends GetxController {
  Rx<MvvmApiGetxModel> model;
  RxMap apiResult = {}.obs;

  MvvmApiGetxVm(this.model);

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> decode = jsonDecode(response.body);
        List<MvvmApiGetxModel> json = decode
            .map((val) => MvvmApiGetxModel.fromJson(val))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": json};
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
