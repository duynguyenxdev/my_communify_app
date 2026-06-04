import 'package:injectable/injectable.dart';
import 'package:my_communify/config/env.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

@singleton
class SocketClient {
  io.Socket connect({String uri = Env.webSocketUrl, Map? queryParams}) {
    final optionsBuilder = io.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .enableReconnection();

    if (queryParams != null) {
      optionsBuilder.setQuery(queryParams);
    }

    return io.io(uri, optionsBuilder.build()).connect();
  }
}
