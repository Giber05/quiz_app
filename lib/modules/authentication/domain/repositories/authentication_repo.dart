import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRepo {
  Future<UserSessionModel> login({required String email, required String password});
  Future<UserSessionModel> registerUser({required String email, required String password});
  Future<UserSessionModel?> getLastLoggedInUser();
  Future<void> logout();
}
