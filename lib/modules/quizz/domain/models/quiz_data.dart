
import 'package:equatable/equatable.dart';

class QuizData extends Equatable {
  final String? text;
  final String? name;
  final String? value;

  QuizData({
    this.text,
    this.name,
    this.value,
  });

  @override
  List<Object?> get props => [text, name, value];
}