import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

class UserSessionRemoteResMapper implements FromJSONMapper<UserSessionModel> {
  @override
  UserSessionModel toModel(json) {
    return UserSessionModel(
      token: json["token"],
    );
  }
}
