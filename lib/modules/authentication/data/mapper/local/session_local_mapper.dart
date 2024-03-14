import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/local_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

class SessionLocalMapper extends LocalMapper<UserSession, dynamic> {
  SessionLocalMapper();

  @override
  UserSession toDomain(entity) {
    return UserSession(
      token: entity["token"],
    );
  }

  @override
  toEntity(UserSession domain) {
    return {
      "token": domain.token,
    };
  }
}
