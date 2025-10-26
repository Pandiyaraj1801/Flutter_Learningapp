import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/mvvm/api/cubit/mvvm_apicubit_vm.dart';

class MvvmApiCubitView extends StatefulWidget {
  const MvvmApiCubitView({super.key});

  @override
  State<MvvmApiCubitView> createState() => _MvvmApiCubitViewState();
}

class _MvvmApiCubitViewState extends State<MvvmApiCubitView> {
  late MvvmApicubitVm _apicubitVm;

  @override
  void initState() {
    super.initState();
    _apicubitVm = BlocProvider.of<MvvmApicubitVm>(context, listen: false);
    _apicubitVm.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MvvmApicubitVm, MvvmApiState>(
        builder: (context, state) {
          if (state is MvvmApiLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MvvmApiFailureState) {
            return Center(child: Text(state.apiResult["errMsg"]));
          } else if (state is MvvmApiSuccesState) {
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
