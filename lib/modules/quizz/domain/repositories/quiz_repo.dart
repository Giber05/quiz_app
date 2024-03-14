import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';

abstract class QuizRepo {
  Future<List<QuizModel>> getQuizData();
  Future<List<QuizModel>> getCachedQuizzes(String key);
  Future<void> cacheQuizzes(String key, List<QuizModel> quizzes);
}
