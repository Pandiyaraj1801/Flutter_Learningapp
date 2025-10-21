import 'package:flutter/material.dart';
import 'package:learnapp/sharedpreferences/methods.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({super.key});

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: SharedPref.getInstance.getName("username"),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(snapshot.data ?? "Data is empty"),
                ElevatedButton(
                  onPressed: () async {
                    SharedPref.getInstance.setName("username", "kalaiselvi");
                    setState(() {});
                  },
                  child: Text("click me"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
