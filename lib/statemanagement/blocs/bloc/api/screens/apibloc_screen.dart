import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/event.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/state.dart';

class ApiBlocScreen extends StatefulWidget {
  const ApiBlocScreen({super.key});

  @override
  State<ApiBlocScreen> createState() => _ApiBlocScreenState();
}

class _ApiBlocScreenState extends State<ApiBlocScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiBloc>(context).add(ApiInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiBloc, ApiBlocState>(
        builder: (context, state) {
          if (state is ApiInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ApiFailureState) {
            return Center(child: Text(state.errMsg["errMsg"]));
          } else if (state is ApiSuccessState) {
            return ListView.builder(
              itemCount: state.results["todos"].length,
              itemBuilder: (context, index) {
                return Text(state.results["todos"][index]["title"]);
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
