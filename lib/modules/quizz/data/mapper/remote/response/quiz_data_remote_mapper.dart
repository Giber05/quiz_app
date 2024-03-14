import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_data.dart';

class QuizDataMapper implements FromJSONMapper<QuizDataModel> {
  @override
  QuizDataModel toModel(json) {
    return QuizDataModel(
      text: json['text'],
      name: json['name'],
      value: json['value'],
    );
  }
}
