import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/repositories/authentication_repo.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({required this.email, required this.password});
}

@injectable
class RegisterUser extends Usecase<RegisterParams, UserSessionModel> {
  final AuthenticationRepo _authenticationRepo;

  RegisterUser(this._authenticationRepo);

  @override
  Future<Resource<UserSessionModel>> execute(RegisterParams params) =>
      _authenticationRepo.registerUser(email: params.email, password: params.password).asResource;
}
