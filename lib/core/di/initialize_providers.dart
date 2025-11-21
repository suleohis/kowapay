import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

/// Call this ONCE in main() — guarantees everything is ready
Future<void> initializeProviders(ProviderContainer container) async {
  // 1. LocalAuth (biometric) — warm it up early
  final localAuth = container.read(localAuthProvider);
  try {
    final canCheck = await localAuth.canCheckBiometrics;
    final available = await localAuth.getAvailableBiometrics();
    print("Biometrics available: $available | Can check: $canCheck");
  } catch (e) {
    print("Biometric init failed: $e");
  }

  // 2. Try silent biometric login at app start (this is what Kuda does)
  // If user has saved session → auto-login silently
  container.read(authProvider.notifier).loginWithBiometrics();

}