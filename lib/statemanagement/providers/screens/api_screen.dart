import 'package:flutter/material.dart';
import 'package:learnapp/statemanagement/providers/methods/api_provider.dart';
import 'package:provider/provider.dart';

class ApiProviderScreen extends StatefulWidget {
  const ApiProviderScreen({super.key});

  @override
  State<ApiProviderScreen> createState() => _ApiProviderScreenState();
}

class _ApiProviderScreenState extends State<ApiProviderScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<ApiProvider>().getApi();
    Provider.of<ApiProvider>(context, listen: false).getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApiProvider>(
        builder: (context, value, child) {
          if (value.result.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else if (value.result["status"] == "E") {
            return Center(child: Text(value.result["errMsg"]));
          } else if (value.result["status"] == "S") {
            return ListView.builder(
              itemCount: value.result["userList"].length,
              itemBuilder: (context, index) {
                return Text(value.result["userList"][index]["title"]);
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
