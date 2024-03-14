// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/double_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/loading/circular.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/domain/models/quiz_model.dart';
import 'package:com_bahaso_gilang_liberty/modules/quizz/presentation/bloc/quiz_bloc.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

part 'widgets/quiz_stepper.dart';
part 'widgets/question.dart';
part 'widgets/result.dart';

@RoutePage()
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuizBloc>()..add(GetQuizEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quizz'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 40,
                ),
              ),
            )
          ],
        ),
        body: const _QuizContent(),
      ),
    );
  }
}

class _QuizContent extends StatelessWidget {
  const _QuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is GetQuizLoading) {
          return const Center(child: CBCircularLoading());
        } else if (state is GetQuizSuccess) {
          return _QuizStepper(quizData: state.quizData);
        } else if (state is GetQuizFailed) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(state.message)),
              16.verticalSpace,
              CBElevatedButton(
                label: 'Refresh',
                onPressed: () {
                  context.read<QuizBloc>().add(GetQuizEvent());
                },
              )
            ],
          );
        }
        return Container(); // Placeholder for other states
      },
    );
  }
}
