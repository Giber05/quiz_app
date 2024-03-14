import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_data.dart';

class QuizDataMapper implements FromJSONMapper<QuizData> {
  @override
  QuizData toModel(json) {
    return QuizData(
      text: json['text'],
      name: json['name'],
      value: json['value'],
    );
  }
}
