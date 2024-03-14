import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';

class AuthRemoteReqMapper extends ToJSONMapper<({String email, String password})> {
  AuthRemoteReqMapper(super.data);

  @override
  toJSON() {
    return {
      "password": data.password,
      "email": data.email,
    };
  }
}
