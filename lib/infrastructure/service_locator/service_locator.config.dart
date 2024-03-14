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
    as _i15;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i6;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i17;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i16;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i20;
import '../../modules/authentication/domain/usecases/login.dart' as _i22;
import '../../modules/authentication/domain/usecases/logout.dart' as _i24;
import '../../modules/authentication/domain/usecases/register_user.dart'
    as _i26;
import '../../modules/authentication/presentation/screens/login/bloc/login_bloc.dart'
    as _i23;
import '../../modules/authentication/presentation/screens/register_user/bloc/register_user_bloc.dart'
    as _i27;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i29;
import '../../modules/quizz/data/datasource/local/quiz_local_dts.dart' as _i10;
import '../../modules/quizz/data/datasource/remote/quiz_remote_dts.dart'
    as _i11;
import '../../modules/quizz/data/repositories/quiz_repo_impl.dart' as _i13;
import '../../modules/quizz/domain/repositories/quiz_repo.dart' as _i12;
import '../../modules/quizz/domain/usecases/cached_quizzes.dart' as _i18;
import '../../modules/quizz/domain/usecases/get_cached_quizzes.dart' as _i19;
import '../../modules/quizz/domain/usecases/get_quiz_data.dart' as _i21;
import '../../modules/quizz/presentation/bloc/quiz_bloc.dart' as _i25;
import '../architecutre/blocs/messenger/messenger_cubit.dart' as _i9;
import '../architecutre/blocs/session/session_bloc.dart' as _i28;
import '../client/api_client.dart' as _i3;
import '../client/auth_client_impl.dart' as _i4;
import '../client/cb_client_impl.dart' as _i5;
import '../local_storage/hive/hive_local_storage.dart' as _i8;
import '../local_storage/secure_storage/secure_storage.dart' as _i14;
import 'modules/core_module.dart' as _i30;

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
      () => _i4.AuthClient(),
      instanceName: 'AuthClient',
    );
    gh.lazySingleton<_i3.APIClient>(
      () => _i5.CBClient(),
      instanceName: 'CBClient',
    );
    gh.factory<_i6.AuthenticationRemoteDTS>(() =>
        _i6.AuthenticationRemoteDTSImpl(
            gh<_i3.APIClient>(instanceName: 'AuthClient')));
    gh.factory<_i7.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.factory<_i8.HiveLocalStorage>(() => _i8.HiveLocalStorageImpl());
    gh.lazySingleton<_i9.MessengerCubit>(() => _i9.MessengerCubit());
    gh.factory<_i10.QuizLocalDts>(
        () => _i10.QuizLocalDtsImpl(gh<_i8.HiveLocalStorage>()));
    gh.factory<_i11.QuizRemoteDts>(() =>
        _i11.QuizRemoteDtsImpl(gh<_i3.APIClient>(instanceName: 'CBClient')));
    gh.factory<_i12.QuizRepo>(() => _i13.QuizRepoImpl(
          gh<_i11.QuizRemoteDts>(),
          gh<_i10.QuizLocalDts>(),
        ));
    gh.factory<_i14.SecureStorage>(
        () => _i14.SecureStorageImpl(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i15.AuthenticationLocalDTS>(
        () => _i15.AuthLocalDTSImpl(gh<_i14.SecureStorage>()));
    gh.factory<_i16.AuthenticationRepo>(() => _i17.AuthenticationRepoImpl(
          gh<_i6.AuthenticationRemoteDTS>(),
          gh<_i15.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i18.CachedQuizzes>(
        () => _i18.CachedQuizzes(gh<_i12.QuizRepo>()));
    gh.factory<_i19.GetCachedQuizzes>(
        () => _i19.GetCachedQuizzes(gh<_i12.QuizRepo>()));
    gh.factory<_i20.GetCurrentSession>(
        () => _i20.GetCurrentSession(gh<_i16.AuthenticationRepo>()));
    gh.factory<_i21.GetQuizData>(() => _i21.GetQuizData(gh<_i12.QuizRepo>()));
    gh.factory<_i22.Login>(() => _i22.Login(gh<_i16.AuthenticationRepo>()));
    gh.factory<_i23.LoginBloc>(() => _i23.LoginBloc(gh<_i22.Login>()));
    gh.factory<_i24.Logout>(() => _i24.Logout(gh<_i16.AuthenticationRepo>()));
    gh.factory<_i25.QuizBloc>(() => _i25.QuizBloc(
          gh<_i21.GetQuizData>(),
          gh<_i19.GetCachedQuizzes>(),
          gh<_i18.CachedQuizzes>(),
        ));
    gh.factory<_i26.RegisterUser>(
        () => _i26.RegisterUser(gh<_i16.AuthenticationRepo>()));
    gh.factory<_i27.RegisterUserBloc>(
        () => _i27.RegisterUserBloc(gh<_i26.RegisterUser>()));
    gh.lazySingleton<_i28.SessionBloc>(
        () => _i28.SessionBloc(gh<_i24.Logout>()));
    gh.factory<_i29.SplashCubit>(
        () => _i29.SplashCubit(gh<_i20.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i30.CoreModules {}
