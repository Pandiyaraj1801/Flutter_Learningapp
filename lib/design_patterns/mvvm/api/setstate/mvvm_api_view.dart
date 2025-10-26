import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/api/setstate/mvvm_api_model.dart';
import 'package:learnapp/design_patterns/mvvm/api/setstate/mvvm_api_vm.dart';

class MvvmApiView extends StatefulWidget {
  const MvvmApiView({super.key});

  @override
  State<MvvmApiView> createState() => _MvvmApiViewState();
}

class _MvvmApiViewState extends State<MvvmApiView> {
  final MvvmApiModel _model = MvvmApiModel();
  late MvvmApiVm _mvvmApiVm;
  Map<String, dynamic> result = {};

  @override
  void initState() {
    super.initState();
    _mvvmApiVm = MvvmApiVm(_model, () => setState(() {}));
    _mvvmApiVm.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _model.response.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _model.response["status"] == "E"
          ? Center(child: Text(_model.response["errMsg"]))
          : _model.response["status"] == "S"
          ? ListView.builder(
              itemCount: _model.response["todos"].length,
              itemBuilder: (context, index) {
                return Text(_model.response["todos"][index].title);
              },
            )
          : Center(child: Text("something went wrong")),
    );
  }
}
