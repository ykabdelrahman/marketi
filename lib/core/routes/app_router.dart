import 'package:go_router/go_router.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/signup_view.dart';
import 'package:marketi/features/onboarding/presentation/views/onboarding_view.dart';
import '../func/transition_page.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(
        path: Routes.login,
        pageBuilder:
            (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: Routes.signup,
        pageBuilder:
            (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const SignupView(),
            ),
      ),
    ],
  );
}
