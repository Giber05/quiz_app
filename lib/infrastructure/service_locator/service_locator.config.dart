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
    as _i13;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i6;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i15;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i14;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i16;
import '../../modules/authentication/domain/usecases/login.dart' as _i18;
import '../../modules/authentication/domain/usecases/logout.dart' as _i20;
import '../../modules/authentication/domain/usecases/register_user.dart'
    as _i22;
import '../../modules/authentication/presentation/screens/login/bloc/login_bloc.dart'
    as _i19;
import '../../modules/authentication/presentation/screens/register_user/bloc/register_user_bloc.dart'
    as _i23;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i25;
import '../../modules/quizz/data/datasource/remote/quiz_remote_dts.dart' as _i9;
import '../../modules/quizz/data/repositories/quiz_repo_impl.dart' as _i11;
import '../../modules/quizz/domain/repositories/quiz_repo.dart' as _i10;
import '../../modules/quizz/domain/usecases/get_quiz_data.dart' as _i17;
import '../../modules/quizz/presentation/bloc/quiz_bloc.dart' as _i21;
import '../architecutre/blocs/messenger/messenger_cubit.dart' as _i8;
import '../architecutre/blocs/session/session_bloc.dart' as _i24;
import '../client/api_client.dart' as _i3;
import '../client/auth_client_impl.dart' as _i5;
import '../client/cb_client_impl.dart' as _i4;
import '../local_storage/secure_storage/secure_storage.dart' as _i12;
import 'modules/core_module.dart' as _i26;

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
    gh.factory<_i9.QuizRemoteDts>(() =>
        _i9.QuizRemoteDtsImpl(gh<_i3.APIClient>(instanceName: 'CBClient')));
    gh.factory<_i10.QuizRepo>(() => _i11.QuizRepoImpl(gh<_i9.QuizRemoteDts>()));
    gh.factory<_i12.SecureStorage>(
        () => _i12.SecureStorageImpl(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i13.AuthenticationLocalDTS>(
        () => _i13.AuthLocalDTSImpl(gh<_i12.SecureStorage>()));
    gh.factory<_i14.AuthenticationRepo>(() => _i15.AuthenticationRepoImpl(
          gh<_i6.AuthenticationRemoteDTS>(),
          gh<_i13.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i16.GetCurrentSession>(
        () => _i16.GetCurrentSession(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i17.GetQuizData>(() => _i17.GetQuizData(gh<_i10.QuizRepo>()));
    gh.factory<_i18.Login>(() => _i18.Login(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(gh<_i18.Login>()));
    gh.factory<_i20.Logout>(() => _i20.Logout(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i21.QuizBloc>(() => _i21.QuizBloc(gh<_i17.GetQuizData>()));
    gh.factory<_i22.RegisterUser>(
        () => _i22.RegisterUser(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i23.RegisterUserBloc>(
        () => _i23.RegisterUserBloc(gh<_i22.RegisterUser>()));
    gh.lazySingleton<_i24.SessionBloc>(
        () => _i24.SessionBloc(gh<_i20.Logout>()));
    gh.factory<_i25.SplashCubit>(
        () => _i25.SplashCubit(gh<_i16.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i26.CoreModules {}
