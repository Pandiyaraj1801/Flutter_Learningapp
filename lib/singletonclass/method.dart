import 'dart:convert';
import 'package:http/http.dart' as http;

class SingleTonClass {
  // Private Constructor
  SingleTonClass._privateConstrutor();

  // Static Instance to create
  static final SingleTonClass _instance = SingleTonClass._privateConstrutor();

  // Static getter to access the instance
  static SingleTonClass get getInstance => _instance;

  // Non-Static method
  Future<Map<String, dynamic>> fetchApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        List<dynamic> todos = jsonDecode(response.body);
        return {"status": "S", "todos": todos};
      } else {
        return {"status": "E", "errMsg": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"status": "E", "errMsg": e.toString()};
    }
  }
}
