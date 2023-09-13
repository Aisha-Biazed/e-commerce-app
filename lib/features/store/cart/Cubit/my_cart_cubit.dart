import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/parse_route.dart';
import 'package:meta/meta.dart';

part 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartState(productsCart: []));

  static MyCartCubit get(context) => BlocProvider.of(context);

  void addToCart(List<ProductCart> cart, ProductCart product) {
    final pro = cart.firstWhereOrNull((element) => element.id == product.id);
    if (pro == null) {
      cart.add(product);
    } else {
      final newProduct = ProductCart(
          id: pro.id,
          category: pro.category,
          image: pro.image,
          price: pro.price,
          counter: pro.counter! + 1,
          title: pro.title);
      cart.removeWhere((element) => element.id == pro.id);
      cart.add(newProduct);
    }
    emit(MyCartState(productsCart: cart));
  }

  void decreaseFromCart(List<ProductCart> cart, ProductCart product) {
    final pro = cart.firstWhereOrNull((element) => element.id == product.id);
    if (pro != null && pro.counter! > 1) {
      final newProduct = ProductCart(
          id: pro.id,
          category: pro.category,
          image: pro.image,
          price: pro.price,
          counter: pro.counter! - 1,
          title: pro.title);
      cart.removeWhere((element) => element.id == pro.id);
      cart.add(newProduct);
      emit(MyCartState(productsCart: cart));
    } else {
      cart.removeWhere((element) => element.id == product.id);
      emit(MyCartState(productsCart: cart));
    }
  }

  void clearCart() {
    state.productsCart = [];
    emit(MyCartState(productsCart: []));
  }

  List<ProductCart> getCart() {
    return state.productsCart;
  }

  double getTotalProductsPrice() {
    final cart = state.productsCart;
    double price = 0;
    for (var product in cart) {
      price += (product.counter ?? 1) * (product.price ?? 1);
    }
    return price;
  }

  int getTotalProductsCount() {
    final cart = state.productsCart;
    int totalCount = 0;
    for (var product in cart) {
      totalCount += product.counter ?? 0;
    }
    return totalCount;
  }
}
