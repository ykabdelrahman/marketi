import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/get_it.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/signup_view.dart';
import 'package:marketi/features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
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
              child: BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              ),
            ),
      ),
      GoRoute(
        path: Routes.signup,
        pageBuilder:
            (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupView(),
              ),
            ),
      ),
      GoRoute(
        path: Routes.home,
        pageBuilder:
            (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const HomeView(),
            ),
      ),
    ],
  );
}
