import 'package:auto_route/auto_route.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/session/session_event.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/presentation/screens/register_user/bloc/register_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/messenger/messenger_cubit.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/blocs/session/session_bloc.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/double_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.gr.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/service_locator/service_locator.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/form/text_field.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/loading/overlay.dart';

part 'widgets/form.dart';

@RoutePage()
class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterUserBloc>(),
      child: Scaffold(
        body: Center(
          child: BlocListener<RegisterUserBloc, RegisterUserState>(
            listener: (context, state) async {
              if (state is RegisterUserSuccess) {
                context.read<SessionBloc>().add(SetCurrentUserEvent(state.session));
                context.router.replace(
                    const HomeRoute()); // Consider using replace to avoid back navigation to the RegisterUser screen
              } else if (state is RegisterUserFailed) {
                context.messenger.showErrorSnackbar(state.message);
              }
            },
            child: Stack(
              children: [
                const Align(alignment: Alignment.center, child: _RegisterUserForm()),
                BlocConsumer<RegisterUserBloc, RegisterUserState>(
                  listener: (context, state) {
                    if (state is RegisterUserFailed) {
                      context.messenger.showErrorSnackbar(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is! RegisterUserLoading) {
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
