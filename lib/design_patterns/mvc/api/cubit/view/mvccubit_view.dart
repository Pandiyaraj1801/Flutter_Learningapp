import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/mvc/api/cubit/controller/mvccubit_controller.dart';
import 'package:learnapp/design_patterns/mvc/api/cubit/model/mvccubit_model.dart';

class MvcApiCubitView extends StatefulWidget {
  const MvcApiCubitView({super.key});

  @override
  State<MvcApiCubitView> createState() => _MvcApiCubitViewState();
}

class _MvcApiCubitViewState extends State<MvcApiCubitView> {
  late MvcApiCubitModel _model;
  late MvcApiCubitController _controller;

  @override
  void initState() {
    super.initState();
    _model = BlocProvider.of<MvcApiCubitModel>(context);
    _controller = MvcApiCubitController(_model);

    _controller.fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MvcApiCubitModel, MvcApiState>(
        builder: (context, state) {
          if (state.apiResult.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (state.apiResult["status"] == "E") {
            return Center(child: Text(state.apiResult["errMsg"]));
          } else if (state.apiResult["status"] == "S") {
            return ListView.builder(
              itemCount: state.apiResult["todos"].length,
              itemBuilder: (context, index) {
                return Text(state.apiResult["todos"][index].title);
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
