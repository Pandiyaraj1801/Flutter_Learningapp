import 'package:flutter/material.dart';
import 'package:learnapp/singletonclass/method.dart';

class SingleTonScreen extends StatefulWidget {
  const SingleTonScreen({super.key});

  @override
  State<SingleTonScreen> createState() => _SingleTonScreenState();
}

class _SingleTonScreenState extends State<SingleTonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SingleTonClass.getInstance.fetchApi(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!["status"] == "E") {
            return Center(child: Text(snapshot.data!["errMsg"]));
          } else if (snapshot.data!["status"] == "S") {
            return ListView.builder(
              itemCount: snapshot.data!["todos"].length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!["todos"][index]["title"]);
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
