// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../quiz_screen.dart';

class _QuestionItem extends StatelessWidget {
  final QuizModel question;
  final Function(String) answerQuestion;
  final int currentQuestionIndex;
  final int totalQuestions;
  final VoidCallback onNext;

  _QuestionItem({
    Key? key,
    required this.question,
    required this.answerQuestion,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.onNext,
  }) : super(key: key);

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}/$totalQuestions',
            style: context.text.bodyLarge,
          ),
          const SizedBox(height: 20),
          ...question.question.map((item) {
            if (item.startsWith('http') && ((item as String).contains('.jpg') || item.contains('.png'))) {
              return Stack(
                children: [
                  const SizedBox(height: 200, child: Center(child: CBCircularLoading())),
                  Center(child: Image.network(item)),
                ],
              );
            } else if (item.startsWith('http') && ((item as String).contains('.mp3'))) {
              return Center(
                child: CBElevatedButton(
                  label: 'Play Audio',
                  suffixIcon: const Icon(Icons.play_circle),
                  onPressed: () async {
                    final url = item.split('?')[0];
                    print(url);
                    audioPlayer.play(UrlSource(url));
                  },
                ),
              );
            } else {
              return Text(
                item,
                style: context.text.bodyLarge,
                textAlign: question.typeQuestion == 'multichoice' ? TextAlign.center : TextAlign.start,
              );
            }
          }).toList(),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          if (question.typeQuestion == 'multichoice')
            ...question.data.map((option) => Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () => answerQuestion(option.value!),
                    child: Text(option.text!),
                  ),
                )),
          if (question.typeQuestion == 'description')
            CBElevatedButton(
              label: 'Next',
              onPressed: onNext,
            )
        ],
      ),
    );
  }
}
