import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/repositories/quiz_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuizData extends UsecaseNoParams<List<QuizModel>> {
  final QuizRepo _quizRepo;

  GetQuizData(this._quizRepo);

  @override
  Future<Resource<List<QuizModel>>> execute() => _quizRepo.getQuizData().asResource;
}
