import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithBiometrics {
  final AuthRepository repository;
  const LoginWithBiometrics(this.repository);

  Future<UserEntity?> call() => repository.loginWithBiometrics();
}