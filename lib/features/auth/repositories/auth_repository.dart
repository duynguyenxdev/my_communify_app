import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:my_communify/core/enums/error_code.dart';
import 'package:my_communify/core/models/exception.dart';
import 'package:my_communify/core/models/result.dart';
import 'package:my_communify/core/network/api_client.dart';
import 'package:my_communify/features/auth/models/auth_response.dart';

@singleton
class AuthRepository {
  final _googleSignIn = GoogleSignIn.instance;
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<ResultType<AuthResponse>> signInWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.authenticate();

      final idToken = googleAccount.authentication.idToken;

      final result = await _apiClient.post(
        '/auth/google',
        data: {'idToken': idToken},
      );

      return switch (result) {
        Ok(value: final data) => Ok(AuthResponse.fromJson(data)),
        Error(value: final failure) => Error(failure),
      };
    } catch (error) {
      return Error(
        ApiException(
          code: ErrorCode.invalidCredentials,
          message: 'Failed to authenticate google account',
        ),
      );
    }
  }

  Future<void> signOut() {
    return _googleSignIn.signOut();
  }

  Future<ResultType<AuthResponse>> authenticateLocalToken(String token) async {
    final result = await _apiClient.post('/auth/token', data: {'token': token});

    return switch (result) {
      Ok(value: final data) => Ok(AuthResponse.fromJson(data)),
      Error(value: final failure) => Error(failure),
    };
  }
}
