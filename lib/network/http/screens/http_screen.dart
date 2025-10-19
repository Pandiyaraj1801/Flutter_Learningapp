import 'package:flutter/material.dart';
import 'package:learnapp/network/http/methods/http_methods.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});

  @override
  State<HttpScreen> createState() => _HttpScreen();
}

class _HttpScreen extends State<HttpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HttpRequests.getApi(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!["status"] == "E") {
            return Center(child: Text(snapshot.data!["errMsg"]));
          } else if (snapshot.data!["status"] == "S") {
            return ListView.builder(
              itemCount: snapshot.data!["usersList"].length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!["usersList"][index].title);
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
