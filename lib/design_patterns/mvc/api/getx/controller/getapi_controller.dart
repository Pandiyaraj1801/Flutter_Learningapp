import 'package:learnapp/design_patterns/mvc/api/getx/model/getapi_model.dart';

class GetxApiController {
  final MvcGetxApiModel _model;

  GetxApiController(this._model);

  Future<void> fetchApi() async {
    _model.getApi();
  }
}
