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
  late int _currentStep;
  late List<String> _answers;

  @override
  void initState() {
    super.initState();
    _currentStep = 0;
    _answers = List.filled(widget.quizData.length, '');
  }

  void _next() {
    setState(() {
      if (_currentStep < widget.quizData.length - 1) {
        _currentStep++;
      }
    });
  }

  void _previous() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }

  void _setAnswer(String answer) {
    setState(() {
      _answers[_currentStep] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: _next,
            onStepCancel: _previous,
            steps: List.generate(
              widget.quizData.length,
              (index) => Step(
                title: Text('Question ${index + 1}'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.quizData[index].question[0],
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: widget.quizData[index].data.map((option) {
                        return RadioListTile(
                          title: Text(option.text!),
                          value: option.text,
                          groupValue: _answers[index],
                          onChanged: (value) {
                            _setAnswer(value.toString());
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _currentStep == 0 ? null : _previous,
                child: Text('Previous'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _currentStep == widget.quizData.length - 1 ? null : _next,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
