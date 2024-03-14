import 'package:auto_route/auto_route.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/cubits/session/session_event.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/presentation/screens/login/bloc/login_bloc.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/presentation/screens/login/bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/double_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.gr.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/form/text_field.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/loading/overlay.dart';

part 'widgets/form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        body: Center(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccess) {
                context.read<SessionBloc>().add(SetCurrentUserEvent(state.session));
                context.router.push(const HomeRoute());
              }
            },
            child: Stack(
              children: [
                const Align(alignment: Alignment.center, child: _LoginForm()),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      context.messenger.showErrorSnackbar(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is! LoginLoading) {
                      return const SizedBox();
                    }
                    return const CBLoadingOverlay();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
