// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kowapay/core/extensions.dart';

import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      if (next.user != null) context.go('/dashboard');
      else if (!next.isLoading && next.user == null) context.go('/login');
    });

    // Auto attempt biometric
    Future.microtask(() => ref.read(authProvider.notifier).loginWithBiometrics());

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

// login_screen.dart
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('Welcome Back', style: TextStyle(fontSize: 32.xxl)),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: state.isLoading ? null : () => ref.read(authProvider.notifier).loginWithBiometrics(),
              child: Text(state.isLoading ? 'Authenticating...' : 'Login with Biometrics'),
            ),
            if (state.error != null)
              Padding(
                padding: EdgeInsets.only(top: 16.l),
                child: Text(state.error!, style: TextStyle(color: Colors.red, fontSize: 14.m)),
              ),
          ],
        ),
      ),
    );
  }
}

// dashboard_screen.dart
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user!;

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello, ${user.fullName}', style: TextStyle(fontSize: 24.xl)),
            SizedBox(height: 20.h),
            Text('₦1,250,000.00', style: TextStyle(fontSize: 48.huge)),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () => ref.read(authProvider.notifier).logout().then((_) => context.go('/login')),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}