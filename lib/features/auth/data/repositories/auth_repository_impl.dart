import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<UserEntity?> loginWithBiometrics() async {
    final success = await localDataSource.authenticate();
    if (!success) return null;

    final token = await localDataSource.getSavedToken();
    if (token == null) return null;

    // In real app: decode JWT or call /me endpoint
    return const UserEntity(
      id: 'user_123',
      fullName: 'Chukwudi Okeke',
      phone: '+2348123456789',
      isKycComplete: true,
    );
  }

  @override
  Future<void> logout() => localDataSource.clearSession();
}