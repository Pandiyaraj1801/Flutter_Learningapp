import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClass {
  WebSocketChannel? _channel;

  WebSocketClass._privateConstructor();

  static final WebSocketClass _instance = WebSocketClass._privateConstructor();

  static WebSocketClass get getInstance => _instance;

  void initChannel() {
    if (_channel == null) {
      getInstance._channel = WebSocketChannel.connect(
        Uri.parse("wss://echo.websocket.org"),
      );
    }
  }

  void sendMsg(String msg) {
    getInstance._channel!.sink.add(msg);
  }

  Stream getMsg() {
    return getInstance._channel!.stream;
  }

  void socketClose() {
    getInstance._channel!.sink.close();
  }
}
