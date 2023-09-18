import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/constants/cash_helper.dart';
import '../../common/models/products_model.dart';
import '../../common/models/profile_model.dart';
import '../error/exception_handler.dart';
import '../utils/app_strings.dart';
import 'dio_helper.dart';
import 'end_points.dart';

class AuthRepo {
  late final Dio _dio;

  AuthRepo() {
    _dio = DioHelper.instance.get();
  }
  Future<Either<String, String>> loginUser(
      {required String userName, required String password}) async {
    try {
      final data = {
        'username': userName,
        'password': password,
      };
      final result = await _dio.post(EndPoints.login, data: data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', result.data.toString());
      print("SuccessfulDataLogin");
      return Right(result.data["token"].toString());
    } catch (error) {
      print("error =$error");
      return const Left("SomeThing Error");
    }
  }

  Future<Either<String, dynamic>> createUserCubit({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _dio.post(EndPoints.register, queryParameters: {
        'email': email,
        'username': userName,
        'password': password
      });
      print("SuccessfulDataCreateUser");
      print(result.data);
      return Right(result.data);
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, ProfileModel>> myProfile() async {
    try {
      final result = await _dio.get(
        EndPoints.profile,
      );
      print("SuccessfulDataProfile");
      return Right(ProfileModel.fromJson(result.data));
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }

  Future<Either<String, List<ProductsModel>>> products() async {
    try {
      final result = await _dio.get(EndPoints.products);
      (result.data as List).map((e) {
        return ProductsModel.fromJson(e);
      }).toList();
      print("SuccessfulDataProducts");
      return Right((result.data as List).map((e) {
        return ProductsModel.fromJson(e);
      }).toList());
    } catch (error) {
      print("error =$error");
      return Left(ExceptionHandler.handle(error as Exception));
    }
  }
}
