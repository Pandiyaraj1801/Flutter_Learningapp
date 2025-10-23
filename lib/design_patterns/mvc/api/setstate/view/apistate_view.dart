import 'package:flutter/material.dart';
import 'package:learnapp/design_patterns/mvc/api/setstate/controller/mvcapi_controller.dart';

class MvcApiSetStateView extends StatefulWidget {
  const MvcApiSetStateView({super.key});

  @override
  State<MvcApiSetStateView> createState() => _MvcApiSetStateViewState();
}

class _MvcApiSetStateViewState extends State<MvcApiSetStateView> {
  final MvcApiController _controller = MvcApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _controller.fetchApi(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!["status"] == "E") {
            return Center(child: Text(snapshot.data!["errMsg"]));
          } else if (snapshot.data!["status"] == "S") {
            return ListView.builder(
              itemCount: snapshot.data!["todos"].length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!["todos"][index].title);
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
