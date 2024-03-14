import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRepo {
  Future<UserSession> login({required String username, required String password});
  Future<UserSession?> getLastLoggedInUser();
  Future<void> logout();
}
