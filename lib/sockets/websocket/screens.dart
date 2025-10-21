import 'package:flutter/material.dart';
import 'package:learnapp/sockets/websocket/methods.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  @override
  void initState() {
    super.initState();
    WebSocketClass.getInstance.initChannel();
  }

  @override
  void dispose() {
    super.dispose();
    WebSocketClass.getInstance.socketClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: WebSocketClass.getInstance.getMsg(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(snapshot.data ?? "Data is empty"),
                ElevatedButton(
                  onPressed: () {
                    WebSocketClass.getInstance.sendMsg("Hi Kalaiselvi");
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
