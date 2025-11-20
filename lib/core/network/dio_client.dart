import 'package:dio/dio.dart';
import '../security/secure_vault.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://api.yourfintech.com',
  connectTimeout: const Duration(seconds: 15),
));

void setupDio() {
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await SecureVault.read('jwt_token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
  ));
}