import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnapp/design_patterns/mvvm/api/setstate/mvvm_api_model.dart';

class MvvmApiVm {
  final MvvmApiModel _model;
  final VoidCallback _setState;

  MvvmApiVm(this._model, this._setState);

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );
      if (response.statusCode == 200) {
        final List<dynamic> decode = jsonDecode(response.body);
        final List<MvvmApiModel> model = decode
            .map((json) => MvvmApiModel.fromJson(json))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": model};
        _model.response = result;
      } else {
        Map<String, dynamic> result = {
          "status": "S",
          "errMsg": jsonDecode(response.body),
        };
        _model.response = result;
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "S", "todos": e.toString()};
      _model.response = result;
    }

    _setState();
  }
}
