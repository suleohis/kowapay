import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart';

class SecureVault {
  static const _storage = FlutterSecureStorage();
  static final _aes = Encrypter(AES(
    Key.fromUtf8('32BYTESUPERSECRET12345678901234'), // CHANGE THIS IN PRODUCTION
    mode: AESMode.gcm,
  ));

  static Future<void> write(String key, String value) async {
    final iv = IV.fromSecureRandom(12);
    final encrypted = _aes.encrypt(value, iv: iv);
    await _storage.write(key: key, value: '${iv.base64}:${encrypted.base64}');
  }

  static Future<String?> read(String key) async {
    final data = await _storage.read(key: key);
    if (data == null) return null;
    final parts = data.split(':');
    final iv = IV.fromBase64(parts[0]);
    return _aes.decrypt64(parts[1], iv: iv);
  }

  static Future<void> deleteAll() => _storage.deleteAll();
}