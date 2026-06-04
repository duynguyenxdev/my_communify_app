class ApiError {
  final String code;
  final String message;

  ApiError({required this.code, required this.message});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'code': code, 'message': message};
  }

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(code: json['code'], message: json['message']);
  }
}
