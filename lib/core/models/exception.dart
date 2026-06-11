sealed class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class ApiException extends AppException {
  final String code;
  ApiException({required this.code, required String message}) : super(message);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'code': code, 'message': message};
  }

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(code: json['code'], message: json['message']);
  }

  @override
  String toString() {
    return 'ApiException(code = $code, message = $message)';
  }
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network error']);

  @override
  String toString() {
    return 'NetworkException(message = $message)';
  }
}

class UnkownException extends AppException {
  UnkownException([super.message = 'Something went wrong']);

  @override
  String toString() {
    return 'UnkownException(message = $message)';
  }
}
