import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/repositories/authentication_repo.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

@injectable
class Login extends Usecase<LoginParams, UserSessionModel> {
  final AuthenticationRepo _authenticationRepo;

  Login(this._authenticationRepo);

  @override
  Future<Resource<UserSessionModel>> execute(LoginParams params) =>
      _authenticationRepo.login(email: params.email, password: params.password).asResource;
}
