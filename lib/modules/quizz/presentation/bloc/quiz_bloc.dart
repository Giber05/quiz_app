import 'package:bloc/bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/use_case.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/resource.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_data.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/usecases/get_quiz_data.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

@injectable
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizData _getQuizData;
  QuizBloc(this._getQuizData) : super(QuizInitial()) {
    on<GetQuizEvent>(_onGetQuizData);
  }

  Future<void> _onGetQuizData(GetQuizEvent event, Emitter<QuizState> emit) async {
    emit(GetQuizLoading());
    final result = await _getQuizData();

    switch (result) {
      case Success(data: List<QuizModel> quizData):
        emit(GetQuizSuccess(quizData));
      case Error():
        emit(GetQuizFailed(result.exception.message));
      default:
    }
  }
}
