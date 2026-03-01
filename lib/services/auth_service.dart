import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:alisons_machine_test/utils/api_constants.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
        queryParameters: {'email_phone': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
        return response.data;
      }
    } catch (e) {
      log('Auth API Error: $e');
    }
    return null;
  }
}
