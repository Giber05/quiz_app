import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/presentation/widgets/logged_in_wrapper.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthenticatedWrapper(child: _HomeScreenContent());
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Current user token : ${context.userSession}"),
          CBElevatedButton(
              label: "Logout",
              onPressed: () {
                context.logout();
              })
        ],
      ),
    );
  }
}
