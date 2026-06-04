abstract class Env {
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000',
  );

  static const webSocketUrl = String.fromEnvironment(
    'WEB_SOCKET_URL',
    defaultValue: 'http://localhost:3000',
  );
}
