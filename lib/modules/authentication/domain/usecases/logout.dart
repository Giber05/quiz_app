import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/nothing.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/domain/repositories/authentication_repo.dart';

@injectable
class Logout extends UsecaseNoParams<Nothing> {
  final AuthenticationRepo _authRepo;

  Logout(this._authRepo);

  @override
  Future<Resource<Nothing>> execute() async {
    await _authRepo.logout();
    return Resource.success(const Nothing());
  }
}
