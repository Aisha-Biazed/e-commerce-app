import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/app_strings.dart';

class ExceptionHandler {
  static String handle(Exception e) {
    if (e is SocketException) {
      return AppStrings.internetFailure;
    }
    if (e is FormatException) {
      return AppStrings.formatException;
    }
    if (e is DioError) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.receiveTimeout) {
        return AppStrings.connectionError;
      }
      if (e.type == DioErrorType.badResponse) {
        if (e.response?.statusCode == 500) {
          return AppStrings.serverFailure;
        }
        if (e.response?.statusCode == 403) {
          return AppStrings.forbidden;
        }
        if (e.response?.statusCode == 401) {
          return AppStrings.unauthorized;
        }
        if (e.response?.statusCode == 400) {
          return AppStrings.invalidInput;
        }
      }
    }
    return AppStrings.somethingError;
  }
}
