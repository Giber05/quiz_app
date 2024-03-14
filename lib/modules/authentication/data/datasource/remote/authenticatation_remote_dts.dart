import 'package:com_bahaso_gilang_liberty/infrastructure/types/nothing.dart';
import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/client/api_client.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/data/mapper/remote/request/login_request_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRemoteDTS {
  Future<APIResult<UserSession>> login({required String email, required String password});

  Future<APIResult<Nothing>> logout();
}

@Injectable(as: AuthenticationRemoteDTS)
class AuthenticationRemoteDTSImpl implements AuthenticationRemoteDTS {
  final APIClient _cbClient;

  AuthenticationRemoteDTSImpl(this._cbClient);

  @override
  Future<APIResult<UserSession>> login({required String email, required String password}) => _cbClient.post(
      path: 'https://reqres.in/api/login',
      shouldPrint: true,
      useBaseUrl: false,
      body: LoginRemoteReqMapper((password: password, email: email)).toJSON(),
      mapper: (json) => UserSessionRemoteResMapper().toModel(json));

  @override
  Future<APIResult<Nothing>> logout() => _cbClient.post(
        path: 'https://reqres.in/api/logout',
        useBaseUrl: false,
        shouldPrint: true,
        mapper: (json) => const Nothing(),
      );
}
