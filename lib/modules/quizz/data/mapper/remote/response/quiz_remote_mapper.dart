import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/data/mapper/remote/response/quiz_data_remote_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_data.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';

class QuizRemoteMapper implements FromJSONMapper<QuizModel> {
  final quizDataMapper = QuizDataMapper();
  @override
  QuizModel toModel(json) {
    final List<QuizData> quizData = (json['data'] as List<dynamic>).map((e) => quizDataMapper.toModel(e)).toList();
    return QuizModel(
      question: json['question'],
      questionNumber: json['questionnumber'],
      typeQuestion: json['typequestion'],
      name: json['name'],
      value: json['value'],
      grade: json['grade'],
      data: quizData,
    );
  }
}
