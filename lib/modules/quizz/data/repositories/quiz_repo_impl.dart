import 'package:com_bahaso_gilang_liberty/modules/quizz/data/datasource/remote/quiz_remote_dts.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/repositories/quiz_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuizRepo)
class QuizRepoImpl implements QuizRepo {
  final QuizRemoteDts _quizRemoteDts;

  QuizRepoImpl(this._quizRemoteDts);

  @override
  Future<List<QuizModel>> getQuizData() async {
    final getQuizResult = await _quizRemoteDts.getQuizData();
    return getQuizResult.data;
  }
}
