import '../../../common/models/profile_model.dart';

abstract class AuthStates {}

class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {}

class CreateLoadingState extends AuthStates {}

class CreateSuccessState extends AuthStates {}

class CreateErrorState extends AuthStates {}

class ProfileLoadingState extends AuthStates {}

class ProfileSuccessState extends AuthStates {
  ProfileModel result;
  ProfileSuccessState(this.result);
}

class ProfileErrorState extends AuthStates {}

class ProfileState extends AuthStates {}
