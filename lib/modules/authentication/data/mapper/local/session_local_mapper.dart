import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/local_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

class SessionLocalMapper extends LocalMapper<UserSessionModel, dynamic> {
  SessionLocalMapper();

  @override
  UserSessionModel toDomain(entity) {
    return UserSessionModel(
      token: entity["token"],
    );
  }

  @override
  toEntity(UserSessionModel domain) {
    return {
      "token": domain.token,
    };
  }
}
