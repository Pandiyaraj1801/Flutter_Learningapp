import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/bloc.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/state.dart';

class ApiCleanArchScreen extends StatefulWidget {
  const ApiCleanArchScreen({super.key});

  @override
  State<ApiCleanArchScreen> createState() => _ApiCleanArchScreenState();
}

class _ApiCleanArchScreenState extends State<ApiCleanArchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiCleanArchBloc, ApiCleanArchState>(
        builder: (context, state) {
          if (state is ApiCleanArchLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ApiCleanArchFailureState) {
            return Center(child: Text(state.result["errMsg"]));
          } else if (state is ApiCleanArchSuccessState) {
            return ListView.builder(
              itemCount: state.result["todos"].length,
              itemBuilder: (context, index) {
                return Text(state.result["todos"][index].title);
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
