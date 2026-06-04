// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/repositories/auth_repository.dart' as _i1041;
import '../../features/user_search/repositories/user_repository.dart' as _i320;
import '../network/api_client.dart' as _i557;
import '../network/socket_client.dart' as _i206;
import '../storage/local_storage.dart' as _i329;
import '../storage/secure_storage.dart' as _i619;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i557.ApiClient>(() => _i557.ApiClient());
    gh.singleton<_i206.SocketClient>(() => _i206.SocketClient());
    gh.singleton<_i329.LocalStorage>(() => _i329.LocalStorage());
    gh.singleton<_i619.SecureStorage>(() => _i619.SecureStorage());
    gh.singleton<_i1041.AuthRepository>(
      () => _i1041.AuthRepository(gh<_i557.ApiClient>()),
    );
    gh.singleton<_i320.UserRepository>(
      () => _i320.UserRepository(gh<_i557.ApiClient>()),
    );
    return this;
  }
}
