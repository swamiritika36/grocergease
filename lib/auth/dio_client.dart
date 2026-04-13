import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ignore: avoid_print
          print("➡️ ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // ignore: avoid_print
          print("✅ ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // ignore: avoid_print
          print("❌ ${e.message}");
          return handler.next(e);
        },
      ),
    );
}
