import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/client/api_client.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/data/mapper/remote/request/login_request_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRemoteDTS {
  Future<APIResult<UserSession>> login({required String username, required String password});

  Future<APIResult<int>> logout({required String username, required String token});
}

@Injectable(as: AuthenticationRemoteDTS)
class AuthenticationRemoteDTSImpl implements AuthenticationRemoteDTS {
  final APIClient _cbClient;

  AuthenticationRemoteDTSImpl(this._cbClient);

  @override
  Future<APIResult<UserSession>> login({required String username, required String password}) => _cbClient.post(
      path: 'https://reqres.in/api/login',
      shouldPrint: true,
      useBaseUrl: false,
      body: LoginRemoteReqMapper((password: password, username: username)).toJSON(),
      mapper: (json) => UserSessionRemoteResMapper().toModel(json["data"]));

  @override
  Future<APIResult<int>> logout({required String username, required String token}) => _cbClient.post(
        path: 'https://reqres.in/api/login',
        token: token,
        useBaseUrl: false,
        body: {"username": username},
        mapper: (json) => json["data"]["logoutStatus"],
      );
}
