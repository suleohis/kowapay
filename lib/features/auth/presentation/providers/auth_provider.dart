import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_with_biometrics.dart';
import '../../domain/entities/user_entity.dart';

// 1. Data sources
final localAuthProvider = Provider<LocalAuthentication>(
  (ref) => LocalAuthentication(),
);
final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(ref.read(localAuthProvider)),
);

// 2. Repository
final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(authLocalDataSourceProvider)),
);

// 3. Use cases
final loginWithBiometricsProvider = Provider(
  (ref) => LoginWithBiometrics(ref.read(authRepositoryProvider)),
);

// 4. UI State
class AuthState {
  final bool isLoading;
  final UserEntity? user;
  final String? error;
  final bool isLoggedIn;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.error,
    this.isLoggedIn = false,
  });
}

// 5. Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthState());

  final Ref ref;

  Future<void> loginWithBiometrics() async {
    state = const AuthState(isLoading: true);
    try {
      final usecase = ref.read(loginWithBiometricsProvider);
      final user = await usecase();
      state = AuthState(user: user, isLoggedIn: user != null);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});
