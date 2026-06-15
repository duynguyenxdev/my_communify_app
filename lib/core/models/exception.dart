import 'package:my_communify/core/enums/network_error_reason.dart';
import 'package:my_communify/core/enums/security_error_reason.dart';

sealed class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => 'AppException(message = $message)';
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
  NetworkException(super.message, {this.reason = .unknown});

  final NetworkErrorReason reason;

  @override
  String toString() {
    return 'NetworkException(reason = ${reason.name}, message = $message)';
  }
}

class SecurityException extends AppException {
  SecurityException(super.message, {this.reason = .unknown});

  final SecurityErrorReason reason;

  @override
  String toString() {
    return 'SecurityException(reason = ${reason.name}, message = $message)';
  }
}

class UnkownException extends AppException {
  UnkownException([super.message = 'Something went wrong']);

  @override
  String toString() {
    return 'UnkownException(message = $message)';
  }
}
