import 'package:com_bahaso_gilang_liberty/infrastructure/client/api_client.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/data/mapper/remote/response/quiz_remote_mapper.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:injectable/injectable.dart';

abstract class QuizRemoteDts {
  Future<APIResult<List<QuizModel>>> getQuizData();
}

@Injectable(as: QuizRemoteDts)
class QuizRemoteDtsImpl implements QuizRemoteDts {
  final APIClient _cbClient;

  QuizRemoteDtsImpl(@Named('AuthClient') this._cbClient);

  @override
  Future<APIResult<List<QuizModel>>> getQuizData() async {
    return _cbClient.get(
      path: '/quiz/attempt-data-general-english-example',
      shouldPrint: true,
      mapper: (json) => (json['data'] as List<dynamic>).map((e) => QuizRemoteMapper().toModel(e)).toList(),
    );
  }
}
