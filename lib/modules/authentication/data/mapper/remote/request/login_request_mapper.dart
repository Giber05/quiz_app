import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';

class LoginRemoteReqMapper
    extends ToJSONMapper<({String email, String password})> {
  LoginRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {
      "password": data.password,
      "email": data.email,
    };
  }
}
