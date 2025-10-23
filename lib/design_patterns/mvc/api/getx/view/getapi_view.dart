import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvc/api/getx/controller/getapi_controller.dart';
import 'package:learnapp/design_patterns/mvc/api/getx/model/getapi_model.dart';

class GetxApiView extends StatefulWidget {
  const GetxApiView({super.key});

  @override
  State<GetxApiView> createState() => _GetxApiViewState();
}

class _GetxApiViewState extends State<GetxApiView> {
  final MvcGetxApiModel _model = MvcGetxApiModel({}.obs);
  late GetxApiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetxApiController(_model);

    _controller.fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_model.apiResult.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (_model.apiResult["status"] == "E") {
          return Center(child: Text(_model.apiResult["errMsg"]));
        } else if (_model.apiResult["status"] == "S") {
          return ListView.builder(
            itemCount: _model.apiResult["todos"].length,
            itemBuilder: (context, index) {
              return Text(_model.apiResult["todos"][index].title);
            },
          );
        } else {
          return Center(child: Text("something went wrong"));
        }
      }),
    );
  }
}
