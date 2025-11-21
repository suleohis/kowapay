import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kowapay/features/onboarding/presentation/pages/onboarding_screen.dart';

import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
}

final Provider<GoRouter> routerProvider = Provider<GoRouter>((ref) {

  return GoRouter(
    initialLocation: AppRouter.splash,
    routes: [
      GoRoute(path: AppRouter.splash, builder: (_, __) => const SplashScreen()),
      GoRoute(path: AppRouter.onboarding, builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: AppRouter.login, builder: (_, __) => const LoginScreen()),
      GoRoute(path: AppRouter.dashboard, builder: (_, __) => const DashboardScreen()),
    ],
  );
});