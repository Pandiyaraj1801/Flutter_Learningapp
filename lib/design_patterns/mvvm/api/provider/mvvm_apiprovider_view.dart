import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvvm/api/provider/mvvm_apiprovider_vm.dart';
import 'package:provider/provider.dart';

class MvvmApiProviderView extends StatefulWidget {
  const MvvmApiProviderView({super.key});

  @override
  State<MvvmApiProviderView> createState() => _MvvmApiProviderViewState();
}

class _MvvmApiProviderViewState extends State<MvvmApiProviderView> {
  late MvvmApiProviderVm _apiProviderVm;

  @override
  void initState() {
    super.initState();
    _apiProviderVm = Provider.of<MvvmApiProviderVm>(context, listen: false);
    _apiProviderVm.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MvvmApiProviderVm>(
        builder: (context, value, child) {
          if (value.model.response.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (value.model.response["status"] == "E") {
            return Center(child: Text(value.model.response["errMsg"]));
          } else if (value.model.response["status"] == "S") {
            return ListView.builder(
              itemCount: value.model.response["todos"].length,
              itemBuilder: (context, index) {
                return Text(value.model.response["todos"][index].title);
              },
            );
          } else {
            return Center(child: Text("something went wrong"));
          }
        },
      ),
    );
  }
}
