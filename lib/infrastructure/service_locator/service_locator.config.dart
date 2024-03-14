// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/authentication/data/datasource/local/authentication_local_dts.dart'
    as _i10;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i6;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i12;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i11;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i13;
import '../../modules/authentication/domain/usecases/login.dart' as _i14;
import '../../modules/authentication/domain/usecases/logout.dart' as _i16;
import '../../modules/authentication/presentation/screens/login/cubit/login_cubit.dart'
    as _i15;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i18;
import '../architecutre/cubits/messenger/messenger_cubit.dart' as _i8;
import '../architecutre/cubits/session/session_cubit.dart' as _i17;
import '../client/api_client.dart' as _i3;
import '../client/auth_client_impl.dart' as _i5;
import '../client/cb_client_impl.dart' as _i4;
import '../local_storage/secure_storage/secure_storage.dart' as _i9;
import 'modules/core_module.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModules = _$CoreModules();
    gh.lazySingleton<_i3.APIClient>(
      () => _i4.CBClient(),
      instanceName: 'CBClient',
    );
    gh.lazySingleton<_i3.APIClient>(
      () => _i5.AuthClient(),
      instanceName: 'AuthClient',
    );
    gh.factory<_i6.AuthenticationRemoteDTS>(() =>
        _i6.AuthenticationRemoteDTSImpl(
            gh<_i3.APIClient>(instanceName: 'AuthClient')));
    gh.factory<_i7.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.lazySingleton<_i8.MessengerCubit>(() => _i8.MessengerCubit());
    gh.factory<_i9.SecureStorage>(
        () => _i9.SecureStorageImpl(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i10.AuthenticationLocalDTS>(
        () => _i10.AuthLocalDTSImpl(gh<_i9.SecureStorage>()));
    gh.factory<_i11.AuthenticationRepo>(() => _i12.AuthenticationRepoImpl(
          gh<_i6.AuthenticationRemoteDTS>(),
          gh<_i10.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i13.GetCurrentSession>(
        () => _i13.GetCurrentSession(gh<_i11.AuthenticationRepo>()));
    gh.factory<_i14.Login>(() => _i14.Login(gh<_i11.AuthenticationRepo>()));
    gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(gh<_i14.Login>()));
    gh.factory<_i16.Logout>(() => _i16.Logout(gh<_i11.AuthenticationRepo>()));
    gh.lazySingleton<_i17.SessionCubit>(
        () => _i17.SessionCubit(gh<_i16.Logout>()));
    gh.factory<_i18.SplashCubit>(
        () => _i18.SplashCubit(gh<_i13.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i19.CoreModules {}
