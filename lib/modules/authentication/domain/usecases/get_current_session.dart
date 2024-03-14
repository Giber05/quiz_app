import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/model/user_session.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/repositories/authentication_repo.dart';

@injectable
class GetCurrentSession extends UsecaseNoParams<UserSessionModel?> {
  final AuthenticationRepo _authenticationRepo;

  GetCurrentSession(this._authenticationRepo);

  @override
  Future<Resource<UserSessionModel?>> execute() => _authenticationRepo.getLastLoggedInUser().asResource;
}
