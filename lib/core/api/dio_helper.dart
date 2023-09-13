import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/cash_helper.dart';
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
        // debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
        // String? token = prefs.getString('token');
        // options.headers = {'Authorization': 'Bearer$token'};
        // options.headers["Authorization"] = "Bearer" + token!;
        // options.headers['Authorization'] = 'Bearer $token';
        // options.headers['Authorization'] = '$token';
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        CachHelper.sharedPreferences.getString('token');
        // options.headers['content-Type']='application/json';
        // options.headers['Connection']='keep-alive';
        // options.headers['Authorization'] = 'Bearer ${CachHelper.sharedPreferences.getString('token')}';
        return handler.next(options);
      }),
      // InterceptorsWrapper(
      //     onError: (DioException err, ErrorInterceptorHandler handler) async {
      //   debugPrint(
      //       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      //   return handler.next(err);
      // }),
      LogInterceptor(
        responseBody: true,
        // error: true,
        // requestHeader: true,
        // responseHeader: true
      )
    });
  }
  static DioHelper instance = DioHelper._();
  Dio get() {
    return _dio;
  }
}
