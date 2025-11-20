import 'package:local_auth/local_auth.dart';
import '../../../../core/security/secure_vault.dart';

class AuthLocalDataSource {
  final LocalAuthentication localAuth;

  AuthLocalDataSource(this.localAuth);

  Future<bool> authenticate() => localAuth.authenticate(
    localizedReason: 'Login to your account',
    options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
  );

  Future<String?> getSavedToken() => SecureVault.read('jwt_token');
  Future<void> clearSession() => SecureVault.deleteAll();
}