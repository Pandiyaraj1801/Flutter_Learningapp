import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  Map<String, dynamic> result = {};

  Future<void> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List userDetails = jsonDecode(response.body);
        result = {"status": "S", "userList": userDetails};
      } else {
        result = {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      result = {"status": "E", "errMsg": e.toString()};
    }

    notifyListeners();
  }
}
