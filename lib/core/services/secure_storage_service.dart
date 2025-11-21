import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kowapay/core/constants/secure_storage_keys.dart';

class SecureStorageService {
  // Singleton
  SecureStorageService._();
  static final SecureStorageService instance = SecureStorageService._();

  final _storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIOSOptions()
  );

  // Android: Use EncryptedSharedPreferences (AES-256)
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
    keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
    storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding
  );

  // iOS: Use Keychain with highest protection
  static IOSOptions _getIOSOptions() => const IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device
  );


  Future<void> setOnboardingSeen() async {
    await _storage.write(key: SecureStorageKeys.hasSeenOnboarding, value: 'true');
  }

  Future<bool> hasSeenOnboarding() async {
    final value = await _storage.read(key: SecureStorageKeys.hasSeenOnboarding);
    return value == 'true';
  }
}