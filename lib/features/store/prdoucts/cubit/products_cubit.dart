import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/products_model.dart';
import '../../../core/api/auth_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late final AuthRepo _authRepo;
  ProductsCubit() : super(ProductsInitial()) {
    _authRepo = AuthRepo();
  }
  static ProductsCubit get(context) => BlocProvider.of(context);
  void productsCubit() async {
    emit(ProductsLoadingState());
    Either<String, List<ProductsModel>> result = await _authRepo.products();
    result.fold((l) {
      emit(ProductsErrorState());
      //show error
    }, (r) {
      emit(ProductsSuccessState(r as List<ProductsModel>));
      //save user
    });
  }
}
