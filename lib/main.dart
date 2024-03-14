import 'package:com_bahaso_gilang_liberty/modules/quizz/data/mapper/local/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/app.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/env/env.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'modules/quizz/data/mapper/local/models/quiz_data.dart';

void main() async {
  await configureDependencies();
  CBGlobalErrorHandler.setUpErrorHandler();
  await Hive.initFlutter();
  Hive.registerAdapter(QuizAdapter());
  Hive.registerAdapter(QuizDataAdapter());
  await Hive.openBox('quizBox');
  ENV.setEnv(ENV.dev);
  runApp(CBProfielderApp(
    appRouter: AppRouter(),
  ));
}
