import 'package:learnapp/design_patterns/mvc/api/provider/model/providerapi_model.dart';

class MvcProviderApiController {
  final MvcProviderApiModel _model;

  MvcProviderApiController(this._model);

  Future<void> fetchApi() async {
    _model.getApi();
  }
}
