import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/end_points.dart';

class DioFactory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveTimeout: const Duration(seconds: 200),
    connectTimeout: const Duration(seconds: 200),
  ));
  DioFactory._() {
    _dio.interceptors.addAll(<Interceptor>{
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        // options.headers = {'Authorization': 'Bearer$token'};
        // options.headers["Authorization"] = "Bearer" + token!;
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      }),
      LogInterceptor(
        responseBody: true,
      )
    });
  }
  static DioFactory instance = DioFactory._();
  Dio get() {
    return _dio;
  }
}
