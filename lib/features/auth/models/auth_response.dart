import 'package:my_communify/features/auth/models/user.dart';

class AuthResponse {
  final String? accessToken;
  final User? user;

  AuthResponse({required this.accessToken, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}
