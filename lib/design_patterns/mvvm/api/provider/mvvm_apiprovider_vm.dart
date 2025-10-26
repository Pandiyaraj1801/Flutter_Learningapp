import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/api/provider/mvvm_apiprovider_model.dart';
import 'package:http/http.dart' as http;

class MvvmApiProviderVm extends ChangeNotifier {
  final MvvmApiProviderModel model;

  MvvmApiProviderVm(this.model);

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> decode = jsonDecode(response.body);
        List<MvvmApiProviderModel> json = decode
            .map((val) => MvvmApiProviderModel.fromJson(val))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": json};
        model.response = result;
      } else {
        Map<String, dynamic> result = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };
        model.response = result;
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "E", "errMsg": e.toString()};
      model.response = result;
    }

    notifyListeners();
  }
}
