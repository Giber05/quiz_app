import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';

abstract class QuizRepo {
  Future<List<QuizModel>> getQuizData();
}