import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/models/profile_model.dart';
import '../../../core/api/auth_repo.dart';
import '../../../core/config/routing/router.dart';

class AuthCubit extends Cubit<AuthStates> {
  late final AuthRepo _authRepo;

  AuthCubit() : super(LoginInitialState()) {
    _authRepo = AuthRepo();
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  //methods
  void loginCubit(
      {required String userName,
      required String password,
      required context}) async {
    emit(LoginLoadingState());
    Either<String, String> result =
        await _authRepo.loginUser(userName: userName, password: password);
    result.fold((l) {
      BotToast.showText(text: l);
      emit(LoginErrorState());
    }, (r) {
      emit(LoginSuccessState());
    });
  }

// CreateUser
  void createUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(CreateLoadingState());
    Either<String, dynamic> result = await _authRepo.createUserCubit(
      email: email,
      password: password,
      userName: userName,
    );
    result.fold((l) {
      emit(CreateErrorState());
      //show error
    }, (r) {
      emit(CreateSuccessState());
    });
  }

  // Get user profile
  void profileCubit() async {
    emit(ProfileLoadingState());
    Either<String, ProfileModel> result = await _authRepo.myProfile();
    result.fold((l) {
      emit(ProfileErrorState());
    }, (r) {
      emit(ProfileSuccessState(r as ProfileModel));
    });
  }

  String email = '';
  String password = '';
  String userName = '';
  void getInfoFromRegister(
      {required String valEmail,
      required String valPassword,
      required String valUserName}) {
    email = valEmail;
    password = valPassword;
    userName = valUserName;
    emit(ProfileState());
  }
}
