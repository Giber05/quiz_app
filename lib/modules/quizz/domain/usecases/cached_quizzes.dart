import 'package:com_bahaso_gilang_liberty/infrastructure/types/nothing.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/repositories/quiz_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';

class CachedQuizzesParams {
  final String key;
  final List<QuizModel> quizzes;
  CachedQuizzesParams({required this.key, required this.quizzes});
}

@injectable
class CachedQuizzes extends Usecase<CachedQuizzesParams, Nothing> {
  final QuizRepo _quizRepo;

  CachedQuizzes(this._quizRepo);

  @override
  Future<Resource<Nothing>> execute(CachedQuizzesParams params) async {
    await _quizRepo.cacheQuizzes(params.key, params.quizzes);
    return Resource.success(const Nothing());
  }
}
