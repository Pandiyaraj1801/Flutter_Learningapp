import 'package:flutter/material.dart';
import 'package:learnapp/network/dio/methods/dio_methods.dart';

class DioScreen extends StatefulWidget {
  const DioScreen({super.key});

  @override
  State<DioScreen> createState() => _MyDioScreen();
}

class _MyDioScreen extends State<DioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DioRequests.getApi(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!["status"] == "E") {
            return Center(child: Text(snapshot.data!["errMsg"]));
          } else if (snapshot.data!["status"] == "S") {
            return ListView.builder(
              itemCount: snapshot.data!["userList"].length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!["userList"][index].title);
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
