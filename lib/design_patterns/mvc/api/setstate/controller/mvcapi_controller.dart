import 'package:learnapp/design_patterns/mvc/api/setstate/model/mvcapi_model.dart';

class MvcApiController {
  Future<Map<String, dynamic>> fetchApi() async {
    return MvcApiModel.getApi();
  }
}
