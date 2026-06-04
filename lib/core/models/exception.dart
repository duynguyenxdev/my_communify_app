sealed class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class ApiException extends AppException {
  final String code;
  ApiException({required this.code, required String message}) : super(message);
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network error']);
}

class UnkownException extends AppException {
  UnkownException([super.message = 'Something went wrong']);
}
