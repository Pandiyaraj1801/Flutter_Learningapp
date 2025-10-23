import 'package:learnapp/design_patterns/mvc/api/cubit/model/mvccubit_model.dart';

class MvcApiCubitController {
  final MvcApiCubitModel _model;

  MvcApiCubitController(this._model);

  Future<void> fetchApi() async {
    _model.getApi();
  }
}
