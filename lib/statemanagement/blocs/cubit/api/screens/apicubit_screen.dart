import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/cubit/api/methods/api_cubit.dart';

class ApiCubitScreen extends StatefulWidget {
  const ApiCubitScreen({super.key});

  @override
  State<ApiCubitScreen> createState() => _ApiCubitScreenState();
}

class _ApiCubitScreenState extends State<ApiCubitScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiCubit>(context).getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiCubit, ApiState>(
        builder: (context, state) {
          if (state.userList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (state.userList["status"] == "E") {
            return Center(child: Text(state.userList["errMsg"]));
          } else if (state.userList["status"] == "S") {
            return ListView.builder(
              itemCount: state.userList["userList"].length,
              itemBuilder: (context, index) {
                return Text(state.userList["userList"][index]["title"]);
              },
            );
          } else {
            return Text("something went wrong");
          }
        },
      ),
    );
  }
}
