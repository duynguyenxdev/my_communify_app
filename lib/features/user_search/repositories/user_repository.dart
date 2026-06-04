import 'package:injectable/injectable.dart';
import 'package:my_communify/core/models/result.dart';
import 'package:my_communify/core/network/api_client.dart';
import 'package:my_communify/features/auth/models/user.dart';

@singleton
class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<ResultType<List<User>>> searchUsers(String query) async {
    final result = await _apiClient.get<List>(
      '/users/search',
      queryParameters: {'q': query},
    );
    return switch (result) {
      Ok(value: final data) => Ok(
        List<User>.from(data.map((e) => User.fromJson(e))),
      ),
      Error(value: final failure) => Error(failure),
    };
  }
}
