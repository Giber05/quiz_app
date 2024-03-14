import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/double_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/gen/assets.gen.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/routing/router.gr.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/outlined_button.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/layouts/dialog/dialog_container.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/loading/circular.dart';
import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:com_bahaso_gilang_liberty/modules/authentication/presentation/widgets/logged_in_wrapper.dart';
import 'package:sizer/sizer.dart';

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

  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DialogContainer(
        maxHeightPercentage: .3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 50,
                color: context.color.primary,
              ),
              8.verticalSpace,
              Text(
                context.userSession.token,
                textAlign: TextAlign.center,
                style: context.text.bodySmall
                    ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold, color: context.color.primary),
              ),
              24.verticalSpace,
              CBOutlinedButton(
                label: 'Logout',
                onPressed: () {
                  context.logout();
                },
                outlinedColor: context.color.error,
                textStyle: context.text.bodySmall?.copyWith(color: context.color.error, fontWeight: FontWeight.bold),
              ),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProfile(context),
        child: const Icon(Icons.account_circle),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: context.color.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CBElevatedButton(
                      label: "Get Started",
                      onPressed: () {
                        context.router.push(const QuizRoute());
                      },
                      fillParent: false,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.color.background,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        16.verticalSpace,
                        Expanded(
                            child: Stack(
                          children: [
                            const Center(child: CBCircularLoading()),
                            Image.asset(Assets.images.getStarted.path),
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'The Quiz Challenge',
                            style: context.text.titleLarge,
                          ),
                        ),
                        16.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Think you're genius? Prove it with our challenges quizzes",
                            textAlign: TextAlign.center,
                            style: context.text.titleSmall,
                          ),
                        ),
                        24.verticalSpace,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
