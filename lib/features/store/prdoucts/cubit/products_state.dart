part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  List<ProductsModel> result;
  ProductsSuccessState(this.result);
}

class ProductsLoadingState extends ProductsState {}

class ProductsErrorState extends ProductsState {}
