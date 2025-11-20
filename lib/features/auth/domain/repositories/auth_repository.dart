import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> loginWithBiometrics();
  Future<void> logout();
}