// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/authentication/data/datasource/local/authentication_local_dts.dart'
    as _i9;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i5;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i11;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i10;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i12;
import '../../modules/authentication/domain/usecases/login.dart' as _i13;
import '../../modules/authentication/domain/usecases/logout.dart' as _i15;
import '../../modules/authentication/presentation/screens/login/cubit/login_cubit.dart'
    as _i14;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i17;
import '../architecutre/cubits/messenger/messenger_cubit.dart' as _i7;
import '../architecutre/cubits/session/session_cubit.dart' as _i16;
import '../client/api_client.dart' as _i3;
import '../client/cb_client_impl.dart' as _i4;
import '../local_storage/secure_storage/secure_storage.dart' as _i8;
import 'modules/core_module.dart' as _i18;

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
    gh.lazySingleton<_i3.APIClient>(() => _i4.CBClient());
    gh.factory<_i5.AuthenticationRemoteDTS>(
        () => _i5.AuthenticationRemoteDTSImpl(gh<_i3.APIClient>()));
    gh.factory<_i6.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.lazySingleton<_i7.MessengerCubit>(() => _i7.MessengerCubit());
    gh.factory<_i8.SecureStorage>(
        () => _i8.SecureStorageImpl(gh<_i6.FlutterSecureStorage>()));
    gh.factory<_i9.AuthenticationLocalDTS>(
        () => _i9.AuthLocalDTSImpl(gh<_i8.SecureStorage>()));
    gh.factory<_i10.AuthenticationRepo>(() => _i11.AuthenticationRepoImpl(
          gh<_i5.AuthenticationRemoteDTS>(),
          gh<_i9.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i12.GetCurrentSession>(
        () => _i12.GetCurrentSession(gh<_i10.AuthenticationRepo>()));
    gh.factory<_i13.Login>(() => _i13.Login(gh<_i10.AuthenticationRepo>()));
    gh.factory<_i14.LoginCubit>(() => _i14.LoginCubit(gh<_i13.Login>()));
    gh.factory<_i15.Logout>(() => _i15.Logout(gh<_i10.AuthenticationRepo>()));
    gh.lazySingleton<_i16.SessionCubit>(
        () => _i16.SessionCubit(gh<_i15.Logout>()));
    gh.factory<_i17.SplashCubit>(
        () => _i17.SplashCubit(gh<_i12.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i18.CoreModules {}
