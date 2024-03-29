import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/messenger/messenger_cubit.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/session/session_bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/error_handler/global_errror_catcher.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/styles/color.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/styles/text.dart';

class CBProfielderApp extends StatelessWidget {
  final AppRouter appRouter;
  const CBProfielderApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessengerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionBloc>(),
        ),
      ],
      child: Sizer(builder: (context, _, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          builder: (context, child) {
            return GlobalErrorCatcher(
              child: CBMessengerListener(
                child: child,
              ),
              onSessionExpire: () {
                context.messenger.showErrorSnackbar("Session Expired");
                context.logout();
              },
            );
          },
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: ThemeData(
            textTheme: CBTextTheme.textTheme,
            colorScheme: CBTheme.lightScheme,
          ),
        );
      }),
    );
  }
}

class CBMessengerListener extends StatelessWidget {
  final Widget? child;
  const CBMessengerListener({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessengerCubit, MessengerState>(
      listener: (context, state) {
        if (state is MessengerIdle) return;
        if (state is MessengerSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: state.backgroundColor(context),
          ));
        }
        context.read<MessengerCubit>().idle();
      },
      child: child,
    );
  }
}
