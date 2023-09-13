import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/end_points.dart';

class DioHelper {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveTimeout: const Duration(seconds: 200),
    connectTimeout: const Duration(seconds: 200),
  ));
  DioHelper._() {
    _dio.interceptors.addAll(<Interceptor>{
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // final prefs = await SharedPreferences.getInstance();
        // String? token = prefs.getString('token');
        return handler.next(options);
      }),
      LogInterceptor(
        responseBody: true,
      )
    });
  }
  static DioHelper instance = DioHelper._();
  Dio get() {
    return _dio;
  }
}
