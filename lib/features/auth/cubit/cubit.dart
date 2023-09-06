import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stay_home/Presntation/login/cubit/states.dart';
import 'package:stay_home/Presntation/resources/routes_manager.dart';
import 'package:stay_home/data_remote/auth_repo.dart';
import 'package:stay_home/model/all_cities_with_area_model.dart';
import 'package:stay_home/model/check_order_model.dart';
import 'package:stay_home/model/details_shop_model.dart';
import 'package:stay_home/model/order_tracking_model.dart';
import 'package:stay_home/model/shope_model.dart';
import '../../../model/all_areas_model.dart';
import '../../../model/all_cities_model.dart';
import '../../../model/home_model.dart';
import '../../../model/profile_model.dart';

class InitialCubit extends Cubit<InitialStates> {
  late final AuthRepo _authRepo;

  InitialCubit() : super(LoginInitialState()) {
    _authRepo = AuthRepo();
  }

  static InitialCubit get(context) => BlocProvider.of(context);

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    Either<String, String> result = await _authRepo.loginUser(email: email, password: password);
    result.fold((l) {
      BotToast.showText(text: l);
      emit(LoginErrorState());
      //show error
    }, (r) {
      emit(LoginSuccessState());
      //save user
    });
  }

  void createUser(
      {required String fullName,
      required String email,
      required String password,
      required String phoneNumber,
      required String birthdate,
      required BuildContext context,
      required String cityId,
      // String? deviceToken,
      required String gender}) async {
    emit(CreateLoadingState());

    Either<String, String> result = await _authRepo.createUserCubit(
      email: email,
      password: password,
      fullName: fullName,
      birthdate: birthdate,
      phoneNumber: phoneNumber,
      cityId: cityId,
      gender: gender,
    );

    result.fold((l) {
      emit(CreateErrorState());
      //show error
    }, (r) {
      emit(CreateSuccessState());
      Navigator.pushNamed(context, Routes.profilesRoute, arguments: r);
    });
  }

  void modifyProfileCubit(
      {required String fullName,
      required String email,
      required String phoneNumber,
      required String birthdate,
      required BuildContext context,
      required String gender}) async {
    // emit(ModifyProfileLoadingState());
    BotToast.showLoading();
    Either<String, dynamic> result = await _authRepo.modifyProfile(
      email: email,
      fullName: fullName,
      birthdate: birthdate,
      phoneNumber: phoneNumber,
      gender: gender,
    );

    result.fold((l) {
      // emit(ModifyProfileErrorState());
      //show error
      BotToast.closeAllLoading();
      BotToast.showText(text: 'حدث خطأ ما، حاول مرة أخرى');
    }, (r) {
      // emit(ModifyProfileSuccessState());
      BotToast.closeAllLoading();
      BotToast.showText(text: 'تم التعديل بنجاح');
    });
  }

  void profileCubit() async {
    emit(ProfileLoadingState());
    Either<String, ProfileModel> result = await _authRepo.myProfile();
    result.fold((l) {
      emit(ProfileErrorState());
    }, (r) {
      emit(ProfileSuccessState(r as ProfileModel));
    });
  }

  void homeCubit() async {
    emit(HomeLoadingState());
    Either<String, List<HomeModel>> result = await _authRepo.getHome();
    result.fold((l) {
      emit(HomeErrorState());
      //show error
    }, (r) {
      emit(HomeSuccessState(r as List<HomeModel>));
      //save user
    });
  }

  void getAllCitiesCubit() async {
    emit(GetAllCitiesLoadingState());
    Either<String, List<GetAllCitiesModel>> result = await _authRepo.getAllCities();
    result.fold((l) {
      emit(GetAllCitiesErrorState());
      //show error
    }, (r) {
      emit(GetAllCitiesSuccessState(r as List<GetAllCitiesModel>));
      //save user
    });
  }

  void getAllAreasCubit() async {
    emit(GetAllAreasLoadingState());
    Either<String, List<GetAllAreasModel>> result = await _authRepo.getAllAreas();
    result.fold((l) {
      emit(GetAllAreasErrorState());
      //show error
    }, (r) {
      emit(GetAllAreasSuccessState(r as List<GetAllAreasModel>));
      //save user
    });
  }

  void getAllCitiesWithAreasCubit() async {
    emit(GetAllCitiesWithAllCitiesLoadingState());
    Either<String, List<GetAllCitiesWithAreasModel>> result = await _authRepo.getAllCitiesWithAreas();
    result.fold((l) {
      emit(GetAllCitiesWithAllCitiesErrorState());
      //show error
    }, (r) {
      emit(GetAllCitiesWithAllCitiesSuccessState(r as List<GetAllCitiesWithAreasModel>));
      //save user
    });
  }

  void shopCubit() async {
    print('state test');
    print(state);
    emit(ShopLoadingState());
    Either<String, List<ShopModel>> listShop = await _authRepo.getShop();
    listShop.fold((l) {
      emit(ShopErrorState());
      //show error
    }, (r) {
      emit(ShopSuccessState(r as List<ShopModel>));
      //save user
    });
  }

  void detailsShopCubit(String shopId) async {
    emit(DetailsLoadingState());
    Either<String, DetailsShopModel> result = await _authRepo.detailsShop(shopId);
    result.fold((l) {
      emit(DetailsShopErrorState());
      //show error
    }, (r) {
      emit(DetailsShopSuccessState(r as DetailsShopModel));
      //save user
    });
  }

  void orderCheckCubit(String destinationAreaId, String sourceAreaId) async {
    emit(OrderCheckLoadingState());
    Either<String, OrderCheckModel> result = await _authRepo.orderCheck(destinationAreaId, sourceAreaId);
    result.fold((l) {
      emit(OrderCheckErrorState());
      //show error
    }, (r) {
      emit(OrderCheckSuccessState(r as OrderCheckModel));
      //save user
    });
  }

  void orderCheckShopCubit(String destinationAreaId, String sourceAreaId) async {
    print('orderCheckShop');

    emit(OrderCheckLoadingState());
    Either<String, OrderCheckModel> result = await _authRepo.orderCheckShop(destinationAreaId, sourceAreaId);
    result.fold((l) {
      emit(OrderCheckErrorState());
      //show error
    }, (r) {
      emit(OrderCheckSuccessState(r as OrderCheckModel));
      //save user
    });
  }

  Future<bool> rateCubit({
    required int star,
    required String comment,
    required String idRate,
  }) async {
    emit(RateLoadingState());
    BotToast.showLoading();
    Either<String, Null> result = await _authRepo.rate(star: star, comment: comment, idRate: idRate);
    final val = result.fold((l) {
      emit(RateErrorState());
      BotToast.closeAllLoading();
      BotToast.showText(text: 'حدث خطأ ما، أعد المحاولة');
      return false;
    }, (r) {
      emit(RateSuccessState());
      BotToast.closeAllLoading();
      BotToast.showText(text: 'شكرًا لك على تقييمك! يساعدنا تقييمك في تحسين تجربة عملائنا.');

      return true;
    });
    return val;
  }

  void cancelCubit({required String idOrder}) async {
    emit(CancelLoadingState());
    BotToast.showLoading();
    Either<String, Null> result = await _authRepo.cancel(idOrder: idOrder);
    result.fold((l) {
      emit(CancelErrorState());
      BotToast.closeAllLoading();
      BotToast.showText(text: 'لم يتم إلغاء الطلب، أعد المحاولة');
    }, (r) {
      emit(CancelSuccessState());
      BotToast.closeAllLoading();
      BotToast.showText(text: 'تم إلغاء الطلب بنجاح');
    });
  }
}
