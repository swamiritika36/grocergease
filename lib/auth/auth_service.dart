
import 'package:dio/dio.dart';
import 'package:flutter_application_1/auth/auth_model.dart';
import 'package:flutter_application_1/auth/dio_client.dart';
 


class AuthService {

  
  static Future<AuthModel> login(
      String email, String password) async {
    try {
      final res = await DioClient.dio.post(
        '/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      return AuthModel.fromJson(res.data);

    } on DioException catch (e) {
      throw Exception(
        e.response?.data['error'] ?? 'Login failed',
      );
    }
  }

  // ✅ SIGNUP API
  static Future<AuthModel> signup(
      String email, String password) async {
    try {
      final res = await DioClient.dio.post(
        '/register',
        data: {
          "email": email,
          "password": password,
        },
      );

      return AuthModel.fromJson(res.data);

    } on DioException catch (e) {
      throw Exception(
        e.response?.data['error'] ?? 'Signup failed',
      );
    }
  }
}
