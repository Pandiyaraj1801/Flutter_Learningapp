import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/core/error/error.dart';
import 'package:http/http.dart' as http;
import 'package:learnapp/design_patterns/clean_architecture/api/features/data/models/api_models.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/entity/api_entity.dart';

abstract interface class ApiCleanArchDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getApi();
}

class ApiCleanArchDataSourceImpl implements ApiCleanArchDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getApi() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos/"),
      );

      if (response.statusCode == 200) {
        List<dynamic> decode = jsonDecode(response.body);
        List<ApiCleanArchEntity> entity = decode
            .map((json) => ApiCleanArchModels.fromJson(json))
            .toList();

        Map<String, dynamic> result = {"status": "S", "todos": entity};

        return right(result);
      } else {
        Map<String, dynamic> result = {
          "status": "E",
          "errMsg": jsonDecode(response.body),
        };

        return left(Failure(result));
      }
    } catch (e) {
      Map<String, dynamic> result = {"status": "E", "errMsg": e.toString()};

      return left(Failure(result));
    }
  }
}
