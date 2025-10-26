import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnapp/design_patterns/mvvm/api/getx/mvvm_apigetx_model.dart';
import 'package:learnapp/design_patterns/mvvm/api/getx/mvvm_apigetx_vm.dart';

class MvvmApiGetxView extends StatefulWidget {
  const MvvmApiGetxView({super.key});

  @override
  State<MvvmApiGetxView> createState() => _MvvmApiGetxViewState();
}

class _MvvmApiGetxViewState extends State<MvvmApiGetxView> {
  final Rx<MvvmApiGetxModel> _model = Rx(MvvmApiGetxModel());
  late MvvmApiGetxVm _apiGetxVm;

  @override
  void initState() {
    super.initState();
    _apiGetxVm = Get.put(MvvmApiGetxVm(_model));
    _apiGetxVm.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_apiGetxVm.apiResult.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (_apiGetxVm.apiResult["status"] == "E") {
          return Center(child: Text(_apiGetxVm.apiResult["errMsg"]));
        } else if (_apiGetxVm.apiResult["status"] == "S") {
          return ListView.builder(
            itemCount: _apiGetxVm.apiResult["todos"].length,
            itemBuilder: (context, index) {
              return Text(_apiGetxVm.apiResult["todos"][index].title);
            },
          );
        } else {
          return Center(child: Text("something went wrong"));
        }
      }),
    );
  }
}
