part of '../quiz_screen.dart';

class _QuizStepper extends StatefulWidget {
  final List<QuizModel> quizData;
  const _QuizStepper({
    Key? key,
    required this.quizData,
  }) : super(key: key);

  @override
  State<_QuizStepper> createState() => _QuizStepperState();
}

class _QuizStepperState extends State<_QuizStepper> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (widget.quizData[_currentQuestionIndex].typeQuestion == 'multichoice') {
      setState(() {
        if (answer == widget.quizData[_currentQuestionIndex].data.firstWhere((option) => option.value == '0').value) {
          _score++;
        }
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: FlutterStepIndicator(
              height: 20,
              durationScroller: const Duration(seconds: 1),
              onChange: (int index) {},
              page: _currentQuestionIndex,
              list: widget.quizData,
            ),
          ),
          _currentQuestionIndex < widget.quizData.length
              ? _QuestionItem(
                  question: widget.quizData[_currentQuestionIndex],
                  answerQuestion: _answerQuestion,
                  currentQuestionIndex: _currentQuestionIndex,
                  totalQuestions: widget.quizData.length,
                  onNext: () {
                    setState(() {
                      _currentQuestionIndex++;
                    });
                  },
                )
              : _ResultQuiz(
                  score: _score,
                  totalQuestions: widget.quizData.length,
                  resetQuiz: _resetQuiz,
                ),
        ],
      ),
    );
  }
}
