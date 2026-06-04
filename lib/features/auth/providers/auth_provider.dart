import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/di/di.dart';
import 'package:my_communify/core/models/exception.dart';
import 'package:my_communify/core/models/result.dart';
import 'package:my_communify/core/network/api_client.dart';
import 'package:my_communify/core/storage/secure_storage.dart';
import 'package:my_communify/features/auth/enums/auth_status.dart';
import 'package:my_communify/features/auth/models/auth_response.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/auth/repositories/auth_repository.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final String? accessToken;
  final User? user;

  const AuthState({this.status = .initial, this.accessToken, this.user});

  bool get isAuthenticated => accessToken != null && status == .authenticated;

  @override
  List<Object?> get props => [accessToken, user, status];
}

class AuthNotififer extends AsyncNotifier<AuthState> {
  final _authService = di.get<AuthRepository>();
  final _apiClient = di.get<ApiClient>();
  final _secureStorage = di.get<SecureStorage>();

  @override
  FutureOr<AuthState> build() {
    return AuthState();
  }

  Future<void> authenticateLocalToken() async {
    final accessToken = await _secureStorage.get(SecureStorageKey.accessToken);

    if (accessToken == null) {
      state = AsyncValue.data(AuthState(status: AuthStatus.unauthenticated));
      return;
    }

    final result = await _authService.authenticateLocalToken(accessToken);

    switch (result) {
      case Ok(value: final data):
        _onAuthSuccess(data);
        break;
      case Error(value: final failure):
        _apiClient.clearAuthCrecentials();
        await _secureStorage.remove(SecureStorageKey.accessToken);
        _onAuthFailure(failure);
        break;
    }
  }

  Future<void> signInWithGoogle() async {
    state = AsyncValue.loading();

    final result = await _authService.signInWithGoogle();

    switch (result) {
      case Ok(value: final data):
        _onAuthSuccess(data);
        break;
      case Error(value: final failure):
        _onAuthFailure(failure);
        break;
    }
  }

  Future<void> signOut() async {
    state = AsyncValue.loading();

    _apiClient.clearAuthCrecentials();

    await Future.wait([
      _authService.signOut(),
      _secureStorage.remove(SecureStorageKey.accessToken),
    ]);

    state = AsyncValue.data(AuthState());
  }

  void _onAuthSuccess(AuthResponse auth) async {
    final accessToken = auth.accessToken;

    _apiClient.setAuthCrecentials(token: accessToken);

    await _secureStorage.set(SecureStorageKey.accessToken, accessToken);

    state = AsyncValue.data(
      AuthState(
        status: .authenticated,
        accessToken: accessToken,
        user: auth.user,
      ),
    );
  }

  void _onAuthFailure(AppException failure) async {
    state = AsyncValue.error(failure, StackTrace.current);
  }
}

final authProvider = AsyncNotifierProvider(AuthNotififer.new);
