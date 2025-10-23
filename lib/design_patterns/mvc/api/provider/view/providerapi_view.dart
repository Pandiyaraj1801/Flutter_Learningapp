import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvc/api/provider/controller/providerapi_controller.dart';
import 'package:learnapp/design_patterns/mvc/api/provider/model/providerapi_model.dart';
import 'package:provider/provider.dart';

class MvcApiProviderScreen extends StatefulWidget {
  const MvcApiProviderScreen({super.key});

  @override
  State<MvcApiProviderScreen> createState() => _MvcApiProviderScreenState();
}

class _MvcApiProviderScreenState extends State<MvcApiProviderScreen> {
  late MvcProviderApiModel _model;
  late MvcProviderApiController _controller;

  @override
  void initState() {
    super.initState();
    _model = Provider.of<MvcProviderApiModel>(context, listen: false);
    _controller = MvcProviderApiController(_model);

    _controller.fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MvcProviderApiModel>(
        builder: (context, value, child) {
          if (value.apiResult.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (value.apiResult["status"] == "E") {
            return Center(child: Text(value.apiResult["errMsg"]));
          } else if (value.apiResult["status"] == "S") {
            return ListView.builder(
              itemCount: value.apiResult["todos"].length,
              itemBuilder: (context, index) {
                return Text(value.apiResult["todos"][index].title);
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
