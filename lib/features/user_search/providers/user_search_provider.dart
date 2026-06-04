import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/core/di/di.dart';
import 'package:my_communify/core/models/result.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/user_search/repositories/user_repository.dart';

class UserSearchState {
  final List<User> users;

  UserSearchState({this.users = const []});
}

class UserSearchNotifier extends AsyncNotifier<UserSearchState> {
  final _userService = di.get<UserRepository>();

  @override
  FutureOr<UserSearchState> build() {
    return UserSearchState();
  }

  Future<void> searchUsers(String query) async {
    state = AsyncValue.loading();

    final result = await _userService.searchUsers(query);

    switch (result) {
      case Ok(value: final data):
        state = AsyncValue.data(UserSearchState(users: data));
        break;
      case Error(value: final failure):
        state = AsyncValue.error(failure, StackTrace.current);
        break;
    }
  }
}

final userSearchProvider = AsyncNotifierProvider(
  UserSearchNotifier.new,
  isAutoDispose: true,
);
