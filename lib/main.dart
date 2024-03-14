import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/app.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/env/env.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';

void main() async {
  await configureDependencies();
  CBGlobalErrorHandler.setUpErrorHandler();
  ENV.setEnv(ENV.dev);
  runApp(CBProfielderApp(
    appRouter: AppRouter(),
  ));
}
